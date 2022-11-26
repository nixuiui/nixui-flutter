import 'package:flutter/material.dart';
import 'package:yaru_color_generator/yaru_color_generator.dart';

part '_colors.dart';
part 'colors.dart';
part '_text.dart';
part 'text.dart';
part '_brand.dart';
part 'brand.dart';
part '_input_field.dart';
part 'input_field.dart';
part '_button.dart';
part 'button.dart';

class NxTheme {
  NxTheme.setupBaseColor({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? info,
    Color? success,
    Color? border,
  }) {
    _nxColor.primary = primary ?? _nxColor.primary;
    _nxColor.secondary = secondary ?? _nxColor.secondary;
    _nxColor.tertiary = tertiary ?? _nxColor.tertiary;
    _nxColor.error = error ?? _nxColor.error;
    _nxColor.warning = warning ?? _nxColor.warning;
    _nxColor.info = info ?? _nxColor.info;
    _nxColor.success = success ?? _nxColor.success;
    _nxColor.border = border ?? _nxColor.border;
  }
  
  NxTheme.setupInputFielldTheme({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? underlinedPadding,
    EdgeInsetsGeometry? dropdownPadding,
    EdgeInsetsGeometry? dropdownUnderlinedPadding,
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    double? radius,
    double? iconSize,
    double? labelSpace,
    List<BoxShadow>? boxShadow,
    Widget? errorIcon,
    Widget? successIcon,
    Color? textColor,
    Color? hintTextColor,
    Color? suffixColor,
    Color? prefixColor,
    Color? backgroundColor,
    Color? disabledTextColor,
    Color? disabledBackgroundColor,
    Color? borderColor,
  }) {
    _nxInputFieldTheme.padding = padding ?? _nxInputFieldTheme.padding;
    _nxInputFieldTheme.underlinedPadding = underlinedPadding ?? _nxInputFieldTheme.underlinedPadding;
    _nxInputFieldTheme.dropdownUnderlinedPadding = dropdownUnderlinedPadding ?? _nxInputFieldTheme.dropdownUnderlinedPadding;
    _nxInputFieldTheme.dropdownPadding = dropdownPadding ?? _nxInputFieldTheme.dropdownPadding;
    _nxInputFieldTheme.fontFamily = fontFamily ?? _nxInputFieldTheme.fontFamily;
    _nxInputFieldTheme.fontWeight = fontWeight ?? _nxInputFieldTheme.fontWeight;
    _nxInputFieldTheme.fontSize = fontSize ?? _nxInputFieldTheme.fontSize;
    _nxInputFieldTheme.radius = radius ?? _nxInputFieldTheme.radius;
    _nxInputFieldTheme.iconSize = iconSize ?? _nxInputFieldTheme.iconSize;
    _nxInputFieldTheme.labelSpace = labelSpace ?? _nxInputFieldTheme.labelSpace;
    _nxInputFieldTheme.boxShadow = boxShadow ?? _nxInputFieldTheme.boxShadow;
    _nxInputFieldTheme.errorIcon = errorIcon ?? _nxInputFieldTheme.errorIcon;
    _nxInputFieldTheme.successIcon = successIcon ?? _nxInputFieldTheme.successIcon;
    _nxInputFieldTheme.color = _NxInputColor(
      text: textColor ?? _nxInputFieldTheme.color?.text,
      hintText: hintTextColor ?? _nxInputFieldTheme.color?.hintText,
      suffix: suffixColor ?? _nxInputFieldTheme.color?.suffix,
      prefix: prefixColor ?? _nxInputFieldTheme.color?.prefix,
      background: backgroundColor ?? _nxInputFieldTheme.color?.background,
      disabledText: disabledTextColor ?? _nxInputFieldTheme.color?.disabledText,
      disabledBackground: disabledBackgroundColor ?? _nxInputFieldTheme.color?.disabledBackground,
      border: borderColor ?? _nxInputFieldTheme.color?.border,
    );
  }

  NxTheme.setupButtonTheme({
    EdgeInsetsGeometry? padding,
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    double? radius,
    double? borderSize,
    double? squareButtonSize,
    double? fontSizeSmallButton,
    double? fontSizeMediumButton,
    double? fontSizeLargeButton,
    EdgeInsetsGeometry? paddingSmallButton,
    EdgeInsetsGeometry? paddingMediumButton,
    EdgeInsetsGeometry? paddingLargeButton,
    Color? textColor,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? borderColor,
    Color? iconColor,
  }) {
    _nxButtonTheme.padding = padding ?? _nxButtonTheme.padding;
    _nxButtonTheme.fontFamily = fontFamily ?? _nxButtonTheme.fontFamily;
    _nxButtonTheme.fontWeight = fontWeight ?? _nxButtonTheme.fontWeight;
    _nxButtonTheme.fontSize = fontSize ?? _nxButtonTheme.fontSize;
    _nxButtonTheme.radius = radius ?? _nxButtonTheme.radius;
    _nxButtonTheme.borderSize = borderSize ?? _nxButtonTheme.borderSize;
    _nxButtonTheme.squareButton?.width = squareButtonSize ?? _nxButtonTheme.squareButton?.width;
    _nxButtonTheme.squareButton?.height = squareButtonSize ?? _nxButtonTheme.squareButton?.height;
    _nxButtonTheme.smallButton = _NxButtonTheme(
      fontSize: fontSize ?? _nxButtonTheme.smallButton?.fontSize,
      padding: padding ?? _nxButtonTheme.smallButton?.padding,
    );
    _nxButtonTheme.mediumButton = _NxButtonTheme(
      fontSize: fontSize ?? _nxButtonTheme.mediumButton?.fontSize,
      padding: padding ?? _nxButtonTheme.mediumButton?.padding,
    );
    _nxButtonTheme.largeButton = _NxButtonTheme(
      fontSize: fontSize ?? _nxButtonTheme.largeButton?.fontSize,
      padding: padding ?? _nxButtonTheme.largeButton?.padding,
    );
    _nxButtonTheme.color = _NxButtonColor(
      text: textColor ?? _nxButtonTheme.color?.text,
      background: backgroundColor ?? _nxButtonTheme.color?.background,
      disabledBackground: disabledBackgroundColor ?? _nxButtonTheme.color?.disabledBackground,
      border: borderColor ?? _nxButtonTheme.color?.border,
      icon: iconColor ?? _nxButtonTheme.color?.icon,
    );
  }

  NxTheme.setupTextTheme({
    String? fontFamily,
    Color? textColor,
  }) {
    _nxTextTheme.fontFamily = fontFamily ?? _nxTextTheme.fontFamily;
    _nxTextTheme.textColor = textColor ?? _nxTextTheme.textColor;
  }
  
  NxTheme.setupBrandTheme({
    Widget? icon,
    String? title,
    String? slogan,
  }) {
    _nxBrandTheme.icon = icon ?? _nxBrandTheme.icon;
    _nxBrandTheme.title = title ?? _nxBrandTheme.title;
    _nxBrandTheme.slogan = slogan ?? _nxBrandTheme.slogan;
  }
}