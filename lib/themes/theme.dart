import 'package:flutter/material.dart';

part '_colors.dart';
part 'colors.dart';

class NxTheme {
  NxTheme.setupBaseColor({
    Color? primary,
    Color? accent,
    Color? error,
    Color? warning,
    Color? info,
    Color? success,
    Color? text,
    Color? border,
  }) {
    _nxColor.primary = primary ?? _nxColor.primary;
    _nxColor.accent = accent ?? _nxColor.accent;
    _nxColor.error = error ?? _nxColor.error;
    _nxColor.warning = warning ?? _nxColor.warning;
    _nxColor.info = info ?? _nxColor.info;
    _nxColor.success = success ?? _nxColor.success;
    _nxColor.text = text ?? _nxColor.text;
    _nxColor.border = border ?? _nxColor.border;
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
}