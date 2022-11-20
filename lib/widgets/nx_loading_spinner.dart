import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

class NxLoadingSpinner extends StatelessWidget {
  const NxLoadingSpinner({
    Key? key,
    this.backgroundColor = Colors.white,
    this.valueColor,
    this.size = 20
  }) : super(key: key);

  final Color backgroundColor;
  final Color? valueColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              backgroundColor: backgroundColor.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? backgroundColor.dark),
            ),
          ),
        ),
    );
  }
}