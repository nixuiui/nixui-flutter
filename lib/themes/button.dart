part of 'theme.dart';

var _nxButtonTheme = _NxButtonTheme(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  fontFamily: null,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  radius: 8,
  borderSize: 1,
  iconSize: 18,
  smallButton: _NxButtonTheme(
    fontSize: 10,
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
  ),
  mediumButton: _NxButtonTheme(
    fontSize: 14,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  ),
  largeButton: _NxButtonTheme(
    fontSize: 18,
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
  ),
  squareButton: _NxButtonTheme(
    width: 32,
    height: 32,
  ),
  color: _NxButtonColor(
    text: Color(0xffffffff),
    background: NxColor.primary,
    disabledBackground: Color(0xffe5e9ef),
    border: NxColor.primary,
    icon: Color(0xffffffff),
  )
);

class NxButtonTheme {
  
  static EdgeInsetsGeometry get padding => _nxButtonTheme.padding!;
  static String? get fontFamily => (_nxButtonTheme.fontFamily ?? _nxTextTheme.fontFamily);
  static FontWeight get fontWeight => _nxButtonTheme.fontWeight!;
  static double get fontSize => _nxButtonTheme.fontSize!;
  static double get radius => _nxButtonTheme.radius!;
  static double get borderSize => _nxButtonTheme.borderSize!;
  static double get iconSize => _nxButtonTheme.iconSize!;
  
  static double get fontSizeSmallButton => _nxButtonTheme.smallButton!.fontSize!;
  static EdgeInsetsGeometry get paddingSmallButton => _nxButtonTheme.smallButton!.padding!;
  
  static double get fontSizeMediumButton => _nxButtonTheme.smallButton!.fontSize!;
  static EdgeInsetsGeometry get paddingMediumButton => _nxButtonTheme.smallButton!.padding!;
  
  static double get fontSizeLargeButton => _nxButtonTheme.smallButton!.fontSize!;
  static EdgeInsetsGeometry get paddingLargeButton => _nxButtonTheme.smallButton!.padding!;
  
  static double get squareButtonSize => _nxButtonTheme.squareButton!.width!;

  static NxButtonColor get color => NxButtonColor(
    text: _nxButtonTheme.color!.text,
    background: _nxButtonTheme.color!.background,
    disabledBackground: _nxButtonTheme.color!.disabledBackground,
    border: _nxButtonTheme.color!.border,
    icon: _nxButtonTheme.color!.icon,
  );

}

class NxButtonColor {
  
  Color? text;
  Color? background;
  Color? disabledBackground;
  Color? border;
  Color? icon;

  NxButtonColor({
    this.text,
    this.background,
    this.disabledBackground,
    this.border,
    this.icon,
  });

}