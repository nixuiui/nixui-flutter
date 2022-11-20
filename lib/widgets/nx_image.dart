import 'package:flutter/material.dart';

class NxImage extends StatelessWidget {
  final ImageProvider? image;
  final double size;
  final double radius;
  final Color borderColor;
  final double borderSize;

  const NxImage({
    Key? key,
    this.image,
    this.borderColor = Colors.transparent,
    this.borderSize = 0,
    this.radius = 0,
    this.size = 60
  }) : super(key: key);

  factory NxImage.avatar({
    ImageProvider? image,
    double size = 0,
    Color borderColor = Colors.transparent,
    double borderSize = 0
  }) => NxImage(
    image: image,
    size: size,
    borderColor: borderColor,
    borderSize: borderSize,
    radius: 100,
  );

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
    );
  }
}