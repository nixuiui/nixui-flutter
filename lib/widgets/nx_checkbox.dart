import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

class NxCheckbox extends StatelessWidget {

  final double? size;
  final double? borderRadius;
  final double? borderSize;
  final Color? borderColor;
  final bool checked;
  final Color? color;
  final Widget? child;
  final double? space;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function(bool)? onTap;

  const NxCheckbox({
    Key? key,
    this.size,
    this.borderRadius,
    this.borderSize,
    this.borderColor,
    this.checked = false,
    this.color,
    this.onTap,
    this.child,
    this.space,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap != null ? () => onTap!.call(!checked) : null,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size ?? 16,
            height: size ?? 16,
            decoration: BoxDecoration(
              color: checked ? (color ?? NxColor.primary) : Colors.transparent,
              border: Border.all(
                color: checked ? (color ?? NxColor.primary) : borderColor ?? Color(0xffBAC7D5), 
                width: borderSize ?? 1
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
            ),
            child: checked 
              ? Icon(
                Icons.check_rounded,
                size: size != null ? (size! - (size!/4)) : 10,
                color: Colors.white,
              )
              : SizedBox.shrink(),
          ),
          if(child != null) Container(
            margin: EdgeInsets.only(left: space ?? 12),
            child: child!
          )
        ],
      ),
    );
  }
}