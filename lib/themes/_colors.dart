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
  Color? accent;
  Color? error;
  Color? warning;
  Color? info;
  Color? success;
  Color? text;
  Color? border;
  _NxInputColor? input;

  _NxColor({
    this.primary,
    this.accent,
    this.error,
    this.warning,
    this.info,
    this.success,
    this.text,
    this.border,
    this.input,
  });
}

var _nxColor = _NxColor(
  primary: Color(0xff8c88ff),
  accent: Color(0xff4fe3c2),
  error: Color(0xffff3366),
  warning: Color(0xffffd807),
  info: Color(0xff4b90e2),
  success: Color(0xff7ed321),
  text: Colors.black87,
  border: Color(0xffe7e7e9),
  input: _NxInputColor(
    text: Colors.black87,
    background: Color(0xffffffff),
    hintText: Color(0xff606770),
    suffix: Color(0xff6e6e72),
    prefix: Color(0xff6e6e72),
    disabledText: Color(0xff98a1ac),
    disabledBackground: Color(0xffe3e7ed),
    border: Color(0xffe7e7e9),
  )
);