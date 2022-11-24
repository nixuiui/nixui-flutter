import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

enum NxTextStyle {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  bodyLight,
  body,
  bodyMedium,
  small,
  extraSmall,
  caption,
}

extension NxTextStyleExtention on NxTextStyle {

  TextStyle? style({
    Color? color,
    TextDecoration? decoration,
    TextOverflow? overflow,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    TextStyle? textStyle;
    
    switch (this) {
      case NxTextStyle.headline1:
        textStyle = TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.headline2:
        textStyle = TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.headline3:
        textStyle = TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.headline4:
        textStyle = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.headline5:
        textStyle = TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.headline6:
        textStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.bodyLight:
        textStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.body:
        textStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.bodyMedium:
        textStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.small:
        textStyle = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.extraSmall:
        textStyle = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      case NxTextStyle.caption:
        textStyle = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: color,
          decoration: decoration,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        );
        break;
      default:
    }

    return textStyle;
  }

}

class _NxTextBasic extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Function? onPressed;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final NxTextStyle? nxTextStyle;
  final String? fontFamily;

  const _NxTextBasic(this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.lineHeight,
    this.maxLines,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.onPressed,
    this.decoration = TextDecoration.none,
    this.overflow,
    this.fontStyle,
    this.nxTextStyle,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var defaultColor = NxTextTheme.textColor;
    if(onPressed != null) {
      defaultColor = NxColor.primary;
    }

    var color = this.color ?? defaultColor;

    var textStyle = nxTextStyle?.style(
      color: color,
      overflow: overflow,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
    );

    textStyle ??= TextStyle(
      height: lineHeight,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      overflow: overflow,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
    );

    Widget textWidget = RichText(
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines ?? DefaultTextStyle.of(context).maxLines,
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        style: textStyle,
        children: List.generate(
          parsedTextList.length, 
          (i) => parsedTextList[i]
        ).toList(),
      ),
    );

    return onPressed != null ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed?.call(),
      child: textWidget,
    ) : textWidget;
  }

  List<TextSpan> get parsedTextList {
    late final Pattern pattern;

    // Example patterns:
    // @username
    // #username
    // **bold text**
    // __italic text__
    // ~~line through text~~
    // ```monospace text```

    final map = {
      r'\*\*(.*?)\*\*': const TextStyle(fontWeight: FontWeight.bold),
      r'__(.*?)__': const TextStyle(fontStyle: FontStyle.italic),
      '~~(.*?)~~': const TextStyle(decoration: TextDecoration.lineThrough),
      r'```(.*?)```': const TextStyle(
        fontFamily: 'mono',
        fontFeatures: [FontFeature.tabularFigures()],
      )
    };
    
    pattern = RegExp(map.keys.map((key) => key).join('|'), multiLine: true);

    final text = this.text;

    final children = <TextSpan>[];
    
    text.splitMapJoin(
      pattern,
      onMatch: (Match match) {
        String? formattedText;
        String? textPattern;
        final patterns = map.keys.toList();
        if (RegExp(patterns[0]).hasMatch(match[0]!)) {
          formattedText = match[0]!.replaceAll('**', '');
          textPattern = patterns[0];
        } else if (RegExp(patterns[1]).hasMatch(match[0]!)) {
          formattedText = match[0]!.replaceAll('__', '');
          textPattern = patterns[1];
        } else if (RegExp(patterns[2]).hasMatch(match[0]!)) {
          formattedText = match[0]!.replaceAll('~~', '');
          textPattern = patterns[2];
        } else if (RegExp(patterns[3]).hasMatch(match[0]!)) {
          formattedText = match[0]!.replaceAll('```', '');
          textPattern = patterns[3];
        }
        children.add(TextSpan(
          text: formattedText,
          style: map[textPattern], 
        ));
        return '';
      },
      onNonMatch: (String text) {
        children.add(TextSpan(
          text: text,
        ));
        return '';
      },
    );
    
    return children;
  }
}

class NxText extends _NxTextBasic {
    
  const NxText(String text, {
    super.key, 
    super.color,
    super.fontSize,
    super.lineHeight,
    super.maxLines,
    super.fontWeight,
    super.textAlign,
    super.onPressed,
    super.decoration,
    super.overflow,
    super.fontStyle,
    super.fontFamily,
  }) : super(
    text,
  );

  const NxText.headline1(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline1,
  );
  
  const NxText.headline2(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline2,
  );

  const NxText.headline3(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline3,
  );

  const NxText.headline4(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline4,
  );

  const NxText.headline5(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline5,
  );
  
  const NxText.headline6(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.headline6,
  );
  
  const NxText.bodyLight(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.bodyLight,
  );

  const NxText.body(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.body,
  );

  const NxText.bodyMedium(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.bodyMedium,
  );
  
  const NxText.small(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.small,
  );
  
  const NxText.extraSmall(String text, {
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.extraSmall,
  );

  const NxText.caption(String text, {
    super.key, 
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.color,
    super.decoration,
    super.fontStyle,
    super.fontFamily,
    super.onPressed,
  }) : super(
    text,
    nxTextStyle: NxTextStyle.caption,
  );
  
}