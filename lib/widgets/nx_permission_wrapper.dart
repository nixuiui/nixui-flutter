import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_text.dart';
import 'package:permission_handler/permission_handler.dart';

class NxPermissionHandlerWrapper extends StatefulWidget {

  final List<Permission> permissions;
  final String? title;
  final String? description;
  final Widget? child;
  final VoidCallback? onGranted;

  const NxPermissionHandlerWrapper({
    Key? key,
    required this.permissions,
    this.title,
    this.description,
    this.child,
    this.onGranted,
  }) : super(key: key);

  @override
  State<NxPermissionHandlerWrapper> createState() => NxPermissionHandlerWrapperState();
}

class NxPermissionHandlerWrapperState extends State<NxPermissionHandlerWrapper> with WidgetsBindingObserver {

  var permissionStatus = <Permission, PermissionStatus>{};
  bool? permissionNeeded;

  @override
  void initState() {
    updatePermission();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await updatePermission();
    }
  }

  void updatePermissionNeeded() {
    var deniedNumber = 0;
    permissionStatus.forEach((key, value) {
      if(value != PermissionStatus.granted && value != PermissionStatus.limited) {
        deniedNumber++;
      }
    });
    if(deniedNumber == 0) {
      widget.onGranted?.call();
    }
    setState(() {
      permissionNeeded = deniedNumber > 0;
    });
  }

  Future updatePermission() async {
    permissionStatus = await widget.permissions.request();
    updatePermissionNeeded();
  }

  @override
  Widget build(BuildContext context) {
    if(!(permissionNeeded ?? true)) {
      return widget.child ?? SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(widget.title != null) Container(
            margin: EdgeInsets.only(bottom: 8),
            child: NxText.headline6(
              widget.title ?? '',
              textAlign: TextAlign.center,
            ),
          ),
          if(widget.description != null) Container(
            margin: EdgeInsets.only(bottom: 24),
            child: NxText(
              widget.description ?? '',
              lineHeight: 1.5,
              color: Colors.black54,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: permissionStatus.keys.map((e) => _buildPermissionItem(
                status: permissionStatus[e] ?? PermissionStatus.permanentlyDenied,
                permission: e,
                onUpdated: (status) {
                  permissionStatus[e] = status;
                }
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionItem({
    required PermissionStatus status,
    required Permission permission,
    required Function(PermissionStatus) onUpdated,
  }) {
    var granted = status == PermissionStatus.granted || status == PermissionStatus.limited;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(granted) Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.check_rounded,
              color: Colors.grey,
            ),
          ),
          NxText(
            granted
                ? '__${permission.toString().split('.').last.toUpperCase()}__ access enabled'
                : 'Enable __${permission.toString().split('.').last.toUpperCase()}__ access',
            color: granted ? Colors.grey : NxColor.primary,
            onPressed: () async {
              if(status == PermissionStatus.permanentlyDenied) {
                await openAppSettings();
                onUpdated.call(await permission.status);
              } else if(status == PermissionStatus.denied) {
                await permission.request();
                onUpdated.call(await permission.status);
              }
            },
          ),
        ],
      ),
    );
  }
}