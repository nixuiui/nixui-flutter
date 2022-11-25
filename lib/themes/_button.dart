part of 'theme.dart';

class _NxButtonTheme {
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  String? fontFamily;
  FontWeight? fontWeight;
  double? fontSize;
  double? radius;
  double? borderSize;
  double? iconSize;
  _NxButtonTheme? smallButton;
  _NxButtonTheme? mediumButton;
  _NxButtonTheme? largeButton;
  _NxButtonTheme? squareButton;
  _NxButtonColor? color;

  _NxButtonTheme({
    this.width,
    this.height,
    this.padding,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.radius,
    this.borderSize,
    this.iconSize,
    this.smallButton,
    this.mediumButton,
    this.largeButton,
    this.squareButton,
    this.color,
  });
}

class _NxButtonColor {
  Color? text;
  Color? background;
  Color? disabledBackground;
  Color? border;
  Color? icon;
  
  _NxButtonColor({
    this.text,
    this.background,
    this.disabledBackground,
    this.border,
    this.icon,
  });
}