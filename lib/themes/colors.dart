part of 'theme.dart';

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

class NxColor {
  
  static Color get primary => _nxColor.primary!;
  static Color get accent => _nxColor.accent!;
  static Color get error => _nxColor.error!;
  static Color get warning => _nxColor.warning!;
  static Color get info => _nxColor.info!;
  static Color get success => _nxColor.success!;
  static Color get text => _nxColor.text!;
  static Color get border => _nxColor.border!;
  
  static NxInputColor get input => NxInputColor(
    text: _nxColor.input!.text,
    hintText: _nxColor.input!.hintText,
    suffix: _nxColor.input!.suffix,
    prefix: _nxColor.input!.prefix,
    background: _nxColor.input!.background,
    disabledText: _nxColor.input!.disabledText,
    disabledBackground: _nxColor.input!.disabledBackground,
    border: _nxColor.input!.border,
  );

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