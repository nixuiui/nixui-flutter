import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: NxColor.primary,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: NxColor.primary,
        ),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        dividerTheme: const DividerThemeData(
          thickness: 0,
          space: 0
        )
      ),
      home: const HomeScreen(),
    );
  }
}