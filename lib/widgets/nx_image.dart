import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_box.dart';
import 'package:nixui/widgets/nx_text.dart';

class _NxImageBasic extends StatelessWidget {
  final ImageProvider? image;
  final double size;
  final double radius;
  final Color borderColor;
  final double borderSize;
  final Widget? child;

  const _NxImageBasic({
    Key? key,
    this.image,
    this.borderColor = Colors.transparent,
    this.borderSize = 0,
    this.radius = 0,
    this.size = 60,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: image != null ? Colors.white : Colors.grey[300],
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor, 
          width: borderSize
        ),
        image: image != null ? DecorationImage(
          fit: BoxFit.cover,
          image: image!
        ) : null
      ),
      child: child
    );
  }
}

class NxImage extends _NxImageBasic {

  const NxImage({
    super.key,
    super.size,
    super.image,
    super.borderColor,
    super.borderSize,
    super.radius,
  });

  NxImage.avatar({
    super.key,
    super.size,
    super.borderColor,
    super.borderSize,
    required String imageUrl,
    Color? backgroundColor,
    String? initialText,
    Color? textColor,
  }) : super(
    radius: 100,
    image: imageUrl != '' ? NetworkImage(imageUrl) : null,
    child: imageUrl == '' ? NxBox(
      borderRadius: 100,
      color: backgroundColor ?? NxColor.secondary,
      padding: EdgeInsets.all(size*0.2),
      child: FittedBox(
        child: NxText(
          initialText ?? '',
          fontWeight: FontWeight.w700,
          color: textColor ?? Colors.white,
        ),
      )
    ) : null,
  );

}