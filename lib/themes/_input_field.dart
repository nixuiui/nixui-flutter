part of 'theme.dart';

class _NxInputFieldTheme {
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? underlinedPadding;
  EdgeInsetsGeometry? dropdownPadding;
  EdgeInsetsGeometry? dropdownUnderlinedPadding;
  String? fontFamily;
  FontWeight? fontWeight;
  double? fontSize;
  double? radius;
  double? iconSize;
  double? labelSpace;
  List<BoxShadow>? boxShadow;
  _NxInputColor? color;

  _NxInputFieldTheme({
    this.padding,
    this.underlinedPadding,
    this.dropdownPadding,
    this.dropdownUnderlinedPadding,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.radius,
    this.iconSize,
    this.labelSpace,
    this.boxShadow,
    this.color,
  });
}

class _NxInputColor {
  Color? text;
  Color? hintText;
  Color? suffix;
  Color? prefix;
  Color? background;
  Color? disabledText;
  Color? disabledBackground;
  Color? border;
  
  _NxInputColor({
    this.text,
    this.hintText,
    this.suffix,
    this.prefix,
    this.background,
    this.disabledText,
    this.disabledBackground,
    this.border,
  });
}