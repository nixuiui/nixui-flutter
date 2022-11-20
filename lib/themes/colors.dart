part of 'theme.dart';

class _NxColor {
  Color primary = Color(0xff8c88ff);
  Color accent = Color(0xff4fe3c2);
  Color error = Color(0xffff3366);
  Color warning = Color(0xffffd807);
  Color info = Color(0xff4b90e2);
  Color success = Color(0xff7ed321);
  
  Color textColor = Colors.black87;
}

var _nxColor = _NxColor();

class NxColor {
  
  static Color get primary => _nxColor.primary;
  
  static Color get accent => _nxColor.accent;
  
  static Color get error => _nxColor.error;
  
  static Color get warning => _nxColor.warning;
  
  static Color get info => _nxColor.info;
  
  static Color get success => _nxColor.success;
  
  static Color get textColor => _nxColor.textColor;

}

extension DoubleExtensions on Color {
  Color get dark {
    const amount = 0.1;

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color get light {
    const amount = 0.1;

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}