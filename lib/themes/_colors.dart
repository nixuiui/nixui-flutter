part of 'theme.dart';

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

class _NxColor {
  Color? primary;
  Color? secondary;
  Color? tertiary;
  Color? error;
  Color? warning;
  Color? info;
  Color? success;
  Color? text;
  Color? border;
  _NxInputColor? input;

  _NxColor({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.warning,
    this.info,
    this.success,
    this.text,
    this.border,
    this.input,
  });
}