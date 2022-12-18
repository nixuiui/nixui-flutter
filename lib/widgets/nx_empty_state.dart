import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_button.dart';

import 'nx_text.dart';

class NxEmptyWidget extends StatelessWidget {
  const NxEmptyWidget({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.buttonText,
    this.buttonColor,
    this.onActionClicked,
    this.isLoading,
    this.customButtonAction,
    this.padding,
    this.color,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onActionClicked;
  final Color? buttonColor;
  final bool? isLoading;
  final Widget? customButtonAction;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      padding: padding ?? EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if(image != null) Container(
            margin: EdgeInsets.only(bottom: 20),
            child: image!
          ),
          if(title != null) Container(
            margin: EdgeInsets.only(bottom: 10),
            child: NxText.headline6(
              title!,
              textAlign: TextAlign.center,
              color: Colors.black87,
            ),
          ),
          if(description != null) Container(
            margin: EdgeInsets.only(bottom: 20),
            child: NxText(
              description!,
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              lineHeight: 1.5,
            ),
          ),
          customButtonAction ?? (
            onActionClicked != null || buttonText != null ? NxButton(
              text: buttonText ?? 'Button',
              isLoading: isLoading ?? false,
              color: buttonColor ?? Theme.of(context).colorScheme.primary,
              onPressed: onActionClicked != null ? onActionClicked!.call : null
            ) : SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}