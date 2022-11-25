part of 'theme.dart';

var _nxInputFieldTheme = _NxInputFieldTheme(
  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  underlinedPadding: EdgeInsets.symmetric(vertical: 12),
  dropdownPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
  dropdownUnderlinedPadding: EdgeInsets.symmetric(vertical: 7),
  fontFamily: null,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  radius: 8,
  iconSize: 18,
  labelSpace: 8,
  boxShadow: [],
  color: _NxInputColor(
    text: Color(0xff0c0e32),
    background: Color(0xffffffff),
    hintText: Color(0xff606770),
    suffix: Color(0xff6e6e72),
    prefix: Color(0xff6e6e72),
    disabledText: Color(0xff98a1ac),
    disabledBackground: Color(0xffe5e9ef),
    border: Color(0xffc9d0db),
  )
);

class NxInputFieldTheme {
  
  static EdgeInsetsGeometry get padding => _nxInputFieldTheme.padding!;
  static EdgeInsetsGeometry get underlinedPadding => _nxInputFieldTheme.underlinedPadding!;
  static EdgeInsetsGeometry get dropdownPadding => _nxInputFieldTheme.dropdownPadding!;
  static EdgeInsetsGeometry get dropdownUnderlinedPadding => _nxInputFieldTheme.dropdownUnderlinedPadding!;
  
  static String? get fontFamily => _nxInputFieldTheme.fontFamily;
  static FontWeight get fontWeight => _nxInputFieldTheme.fontWeight!;
  static double get fontSize => _nxInputFieldTheme.fontSize!;
  static double get radius => _nxInputFieldTheme.radius!;
  static double get iconSize => _nxInputFieldTheme.iconSize!;
  static double get labelSpace => _nxInputFieldTheme.labelSpace!;
  static List<BoxShadow> get boxShadow => _nxInputFieldTheme.boxShadow!;

  static NxInputColor get color => NxInputColor(
    text: _nxInputFieldTheme.color!.text,
    hintText: _nxInputFieldTheme.color!.hintText,
    suffix: _nxInputFieldTheme.color!.suffix,
    prefix: _nxInputFieldTheme.color!.prefix,
    background: _nxInputFieldTheme.color!.background,
    disabledText: _nxInputFieldTheme.color!.disabledText,
    disabledBackground: _nxInputFieldTheme.color!.disabledBackground,
    border: _nxInputFieldTheme.color!.border,
  );

}

class NxInputColor {
  
  Color? text;
  Color? hintText;
  Color? suffix;
  Color? prefix;
  Color? background;
  Color? disabledText;
  Color? disabledBackground;
  Color? border;

  NxInputColor({
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