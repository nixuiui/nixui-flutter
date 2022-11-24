part of 'theme.dart';

var _nxColor = _NxColor(
  primary: Color(0xff7754f6),
  secondary: Color(0xff14a4ee),
  tertiary: Color(0xffffca00),
  error: Color(0xfff6325d),
  warning: Color(0xffff8601),
  info: Color(0xff14a4ee),
  success: Color(0xff7ed321),
  border: Color(0xffc9d0db),
);

Color? _hexToColor(String hexColor) {
  Colors.accents;
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
  return null;
}

Map<int, Color> _color(int colorCode) {
    final color = generateYaruColor(colorCode);
    return {
      50: _hexToColor(color[50]!.toRadixString(16))!,
      100: _hexToColor(color[100]!.toRadixString(16))!,
      200: _hexToColor(color[200]!.toRadixString(16))!,
      300: _hexToColor(color[300]!.toRadixString(16))!,
      400: _hexToColor(color[400]!.toRadixString(16))!,
      500: _hexToColor(color[500]!.toRadixString(16))!,
      600: _hexToColor(color[600]!.toRadixString(16))!,
      700: _hexToColor(color[700]!.toRadixString(16))!,
      800: _hexToColor(color[800]!.toRadixString(16))!,
      900: _hexToColor(color[900]!.toRadixString(16))!,
    };
  }

class NxColor {

  static Color get primary => _nxColor.primary!;
  static Color get primary50 => _color(_nxColor.primary!.value)[50]!;
  static Color get primary100 => _color(_nxColor.primary!.value)[100]!;
  static Color get primary200 => _color(_nxColor.primary!.value)[200]!;
  static Color get primary300 => _color(_nxColor.primary!.value)[300]!;
  static Color get primary400 => _color(_nxColor.primary!.value)[400]!;
  static Color get primary500 => _color(_nxColor.primary!.value)[500]!;
  static Color get primary600 => _color(_nxColor.primary!.value)[600]!;
  static Color get primary700 => _color(_nxColor.primary!.value)[700]!;
  static Color get primary800 => _color(_nxColor.primary!.value)[800]!;
  static Color get primary900 => _color(_nxColor.primary!.value)[900]!;
  
  static Color get secondary => _nxColor.secondary!;
  static Color get secondary50 => _color(_nxColor.secondary!.value)[50]!;
  static Color get secondary100 => _color(_nxColor.secondary!.value)[100]!;
  static Color get secondary200 => _color(_nxColor.secondary!.value)[200]!;
  static Color get secondary300 => _color(_nxColor.secondary!.value)[300]!;
  static Color get secondary400 => _color(_nxColor.secondary!.value)[400]!;
  static Color get secondary500 => _color(_nxColor.secondary!.value)[500]!;
  static Color get secondary600 => _color(_nxColor.secondary!.value)[600]!;
  static Color get secondary700 => _color(_nxColor.secondary!.value)[700]!;
  static Color get secondary800 => _color(_nxColor.secondary!.value)[800]!;
  static Color get secondary900 => _color(_nxColor.secondary!.value)[900]!;
  
  static Color get tertiary => _nxColor.tertiary!;
  static Color get tertiary50 => _color(_nxColor.tertiary!.value)[50]!;
  static Color get tertiary100 => _color(_nxColor.tertiary!.value)[100]!;
  static Color get tertiary200 => _color(_nxColor.tertiary!.value)[200]!;
  static Color get tertiary300 => _color(_nxColor.tertiary!.value)[300]!;
  static Color get tertiary400 => _color(_nxColor.tertiary!.value)[400]!;
  static Color get tertiary500 => _color(_nxColor.tertiary!.value)[500]!;
  static Color get tertiary600 => _color(_nxColor.tertiary!.value)[600]!;
  static Color get tertiary700 => _color(_nxColor.tertiary!.value)[700]!;
  static Color get tertiary800 => _color(_nxColor.tertiary!.value)[800]!;
  static Color get tertiary900 => _color(_nxColor.tertiary!.value)[900]!;
  
  static Color get error => _nxColor.error!;
  static Color get error50 => _color(_nxColor.error!.value)[50]!;
  static Color get error100 => _color(_nxColor.error!.value)[100]!;
  static Color get error200 => _color(_nxColor.error!.value)[200]!;
  static Color get error300 => _color(_nxColor.error!.value)[300]!;
  static Color get error400 => _color(_nxColor.error!.value)[400]!;
  static Color get error500 => _color(_nxColor.error!.value)[500]!;
  static Color get error600 => _color(_nxColor.error!.value)[600]!;
  static Color get error700 => _color(_nxColor.error!.value)[700]!;
  static Color get error800 => _color(_nxColor.error!.value)[800]!;
  static Color get error900 => _color(_nxColor.error!.value)[900]!;

  static Color get warning => _nxColor.warning!;
  static Color get warning50 => _color(_nxColor.warning!.value)[50]!;
  static Color get warning100 => _color(_nxColor.warning!.value)[100]!;
  static Color get warning200 => _color(_nxColor.warning!.value)[200]!;
  static Color get warning300 => _color(_nxColor.warning!.value)[300]!;
  static Color get warning400 => _color(_nxColor.warning!.value)[400]!;
  static Color get warning500 => _color(_nxColor.warning!.value)[500]!;
  static Color get warning600 => _color(_nxColor.warning!.value)[600]!;
  static Color get warning700 => _color(_nxColor.warning!.value)[700]!;
  static Color get warning800 => _color(_nxColor.warning!.value)[800]!;
  static Color get warning900 => _color(_nxColor.warning!.value)[900]!;
  
  static Color get info => _nxColor.info!;
  static Color get info50 => _color(_nxColor.info!.value)[50]!;
  static Color get info100 => _color(_nxColor.info!.value)[100]!;
  static Color get info200 => _color(_nxColor.info!.value)[200]!;
  static Color get info300 => _color(_nxColor.info!.value)[300]!;
  static Color get info400 => _color(_nxColor.info!.value)[400]!;
  static Color get info500 => _color(_nxColor.info!.value)[500]!;
  static Color get info600 => _color(_nxColor.info!.value)[600]!;
  static Color get info700 => _color(_nxColor.info!.value)[700]!;
  static Color get info800 => _color(_nxColor.info!.value)[800]!;
  static Color get info900 => _color(_nxColor.info!.value)[900]!;

  static Color get success => _nxColor.success!;
  static Color get success50 => _color(_nxColor.success!.value)[50]!;
  static Color get success100 => _color(_nxColor.success!.value)[100]!;
  static Color get success200 => _color(_nxColor.success!.value)[200]!;
  static Color get success300 => _color(_nxColor.success!.value)[300]!;
  static Color get success400 => _color(_nxColor.success!.value)[400]!;
  static Color get success500 => _color(_nxColor.success!.value)[500]!;
  static Color get success600 => _color(_nxColor.success!.value)[600]!;
  static Color get success700 => _color(_nxColor.success!.value)[700]!;
  static Color get success800 => _color(_nxColor.success!.value)[800]!;
  static Color get success900 => _color(_nxColor.success!.value)[900]!;

  static Color get border => _nxColor.border!;

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