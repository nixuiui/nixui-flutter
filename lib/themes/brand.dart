part of 'theme.dart';

var _nxBrandTheme = _NxBrandTheme(
  icon: Icon(Icons.circle, color: NxColor.primary,),
  title: 'App',
  slogan: 'Best App'
);

class NxBrandTheme {

  static Widget get icon => _nxBrandTheme.icon!;
  static String get title => _nxBrandTheme.title!;
  static String get slogan => _nxBrandTheme.slogan!;

}