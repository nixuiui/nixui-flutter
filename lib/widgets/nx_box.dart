import 'package:flutter/material.dart';

class NxBox extends StatelessWidget {
  const NxBox({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.borderSize,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.image,
    this.onPressed,
    this.gradient,
    this.isWrap = false
  }) : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderSize;
  final double? borderRadius;
  final Color? borderColor;
  final ImageProvider? image;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onPressed;
  final Gradient? gradient;
  final bool isWrap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.all(0),
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor ?? Colors.transparent, 
            width: borderColor != null ? (borderSize ?? 1) : 0
          ),
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          image: image != null ? DecorationImage(image: image!, fit: BoxFit.cover) : null,
          gradient: gradient
        ),
        child: child,
      ),
    );
  }
}