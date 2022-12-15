import 'package:flutter/material.dart';

import '../themes/theme.dart';
import 'nx_text.dart';

class NxToast extends StatelessWidget {
  
  final String? message;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;

  const NxToast({
    super.key,
    this.message,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  factory NxToast.info({
    String? message,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
  }) => NxToast(
    message: message,
    backgroundColor: NxColor.info,
    textColor: Colors.white,
    icon: Icon(Icons.info_rounded),
  );

  factory NxToast.warning({
    String? message,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
  }) => NxToast(
    message: message,
    backgroundColor: NxColor.warning,
    textColor: Colors.white,
    icon: Icon(Icons.warning_rounded),
  );

  factory NxToast.success({
    String? message,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
  }) => NxToast(
    message: message,
    backgroundColor: NxColor.success,
    textColor: Colors.white,
    icon: Icon(Icons.check_rounded),
  );

  factory NxToast.error({
    String? message,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
  }) => NxToast(
    message: message,
    backgroundColor: NxColor.error,
    textColor: Colors.white,
    icon: Icon(Icons.close_rounded),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor ?? NxColor.info,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon != null) Container(
            width: 20,
            height: 20,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: backgroundColor?.dark,
              borderRadius: BorderRadius.circular(50)
            ),
            child: FittedBox(
              child: Theme(
                data: ThemeData(
                  iconTheme: IconThemeData(
                    color: textColor,
                  ),
                ),
                child: icon!
              )
            ),
          ),
          Expanded(
            child: NxText.extraSmall(
              message ?? '',
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}