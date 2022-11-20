import 'package:flutter/material.dart';

part 'colors.dart';

abstract class NxTheme {
  static void init({
    Color? primaryColor,
    Color? accentColor,
    Color? errorColor,
    Color? warningColor,
    Color? infoColor,
    Color? successColor,
  }) {
    initializeColor();
  }
}

void initializeColor({
    Color? primaryColor,
    Color? accentColor,
    Color? errorColor,
    Color? warningColor,
    Color? infoColor,
    Color? successColor,
  }) {
  _nxColor.primary = primaryColor ?? _nxColor.primary;
  _nxColor.accent = accentColor ?? _nxColor.accent;
  _nxColor.error = errorColor ?? _nxColor.error;
  _nxColor.warning = warningColor ?? _nxColor.warning;
  _nxColor.info = infoColor ?? _nxColor.info;
  _nxColor.success = successColor ?? _nxColor.success;
}