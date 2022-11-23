import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nixui.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({ Key? key }) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxCard Widget"),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'PRIMARY',
                    color: NxColor.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.primary900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.primary50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'SECONDARY',
                    color: NxColor.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.secondary900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.secondary50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'TERTIARY',
                    color: NxColor.tertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.tertiary900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.tertiary50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'INFO',
                    color: NxColor.info,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.info900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.info50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'SUCCESS',
                    color: NxColor.success,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.success900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.success50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'WARNING',
                    color: NxColor.warning,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.warning900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.warning50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NxText(
                    'ERROR',
                    color: NxColor.error,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  NxBox(
                    color: NxColor.error900,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('900', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error800,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('800', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error700,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('700', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error600,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('600', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error500,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('500', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error400,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('400', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error300,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('300', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error200,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('200', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error100,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('100', fontSize: 10, color: Colors.white)),
                  ),
                  NxBox(
                    color: NxColor.error50,
                    width: 30,
                    height: 30,
                    child: Center(child: NxText('50', fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}