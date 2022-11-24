import 'package:flutter/material.dart';
import 'package:yaru_color_generator/yaru_color_generator.dart';

part '_colors.dart';
part 'colors.dart';
part '_text.dart';
part 'text.dart';

class NxTheme {
  NxTheme.setupBaseColor({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? info,
    Color? success,
    Color? text,
    Color? border,
  }) {
    _nxColor.primary ??= primary;
    _nxColor.secondary ??= secondary;
    _nxColor.tertiary ??= tertiary;
    _nxColor.error ??= error;
    _nxColor.warning ??= warning;
    _nxColor.info ??= info;
    _nxColor.success ??= success;
    _nxColor.text ??= text;
    _nxColor.border ??= border;
  }
  
  NxTheme.setupInputColor({
    Color? text,
    Color? hintText,
    Color? suffix,
    Color? prefix,
    Color? background,
    Color? disabledText,
    Color? disabledBackground,
    Color? border,
  }) {
    _nxColor.input = _NxInputColor(
      text: text ?? _nxColor.input?.text,
      hintText: hintText ?? _nxColor.input?.hintText,
      suffix: suffix ?? _nxColor.input?.suffix,
      prefix: prefix ?? _nxColor.input?.prefix,
      background: background ?? _nxColor.input?.background,
      disabledText: disabledText ?? _nxColor.input?.disabledText,
      disabledBackground: disabledBackground ?? _nxColor.input?.disabledBackground,
      border: border ?? _nxColor.input?.border,
    );
  }

  NxTheme.setupTextTheme({
    String? fontFamily,
  }) {
    _nxTextTheme.fontFamily ??= fontFamily;
  }
}