import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/theme.dart';
import 'nx_text.dart';

class NxTextFieldBox extends StatelessWidget {
  const NxTextFieldBox({
    Key? key,
    this.borderRadius = 8,
    this.padding = 8,
    this.prefix,
    this.prefixClicked,
    this.suffix,
    this.suffixClicked,
    this.isObsecure = false,
    this.textHint,
    this.textError = '',
    this.textSuccess = '',
    this.validatorText = '',
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
    this.inputFormatters,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.enable = true,
    this.onChanged,
    this.boxShadow,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final double borderRadius;
  final double padding;
  final TextEditingController? controller;
  final String? textHint, validatorText, textError, textSuccess;
  final Widget? prefix;
  final VoidCallback? prefixClicked;
  final Widget? suffix;
  final VoidCallback? suffixClicked;
  final bool isObsecure;
  final bool enable;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<BoxShadow>? boxShadow;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding + 4, vertical: padding),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.grey[300]!),
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: boxShadow,
          ),
          child: Row(
            children: [
              if(prefix != null) Container(
                margin: EdgeInsets.only(right: 8),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: prefixClicked,
                  child: prefix
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: inputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  inputFormatters: inputFormatters,
                  cursorColor: textColor ?? Colors.black87,
                  enabled: enable,
                  onChanged: onChanged,
                  style: TextStyle(
                    color: enable ? (textColor ?? Colors.black87) : Colors.grey,
                    fontSize: fontSize,
                    fontWeight: fontWeight
                  ),
                  obscureText: isObsecure,
                  keyboardType: inputType,
                  validator: validator,
                  textAlign: textAlign,
                  decoration: InputDecoration.collapsed(
                    hintText: textHint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: textColor != null
                        ? textColor?.withOpacity(0.5)
                        : Colors.black38,
                    fontSize: fontSize)
                  ),
                ),
              ),
              suffix != null ? Container(
                margin: EdgeInsets.only(left: 8),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: suffixClicked,
                  child: suffix
                ),
              ) : Container()
            ],
          ),
        ),
        validatorText != null && validatorText != '' ? Container(
          padding: EdgeInsets.only(top: 4, left: 4, right: 4),
          child: NxText(
            validatorText!,
            color: NxColor.error,
          ),
        ) : Container(),
        textError != '' && textError != null ? Container(
          padding: EdgeInsets.only(top: 4),
          child: NxText(
            textError!,
            color: NxColor.error,
          ),
        ) : Container(),
        textSuccess != '' && textSuccess != null ? Container(
          padding: EdgeInsets.only(top: 4),
          child: NxText(
            textSuccess!,
            color: NxColor.success,
          ),
        ) : Container()
      ],
    );
  }
}

class NxTextFieldBorderBottom extends StatelessWidget {
  const NxTextFieldBorderBottom({
    Key? key,
    this.icon,
    this.suffix,
    this.maxLength = 100,
    this.isObsecure = false,
    this.textHint,
    this.label,
    this.textError = "",
    this.validatorText = "",
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.inputAction,
    this.fontWeight = FontWeight.w400,
    this.onFieldSubmitted,
    this.enable = true,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.suffixClicked
  }) : super(key: key);

  final TextEditingController? controller;
  final String? textHint, validatorText, label, textError;
  final IconData? icon;
  final IconData? suffix;
  final int maxLength;
  final bool isObsecure;
  final bool enable;
  final bool readOnly;
  final bool autofocus;
  final FontWeight fontWeight;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? suffixClicked;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formaters = [];
    formaters.add(LengthLimitingTextInputFormatter(maxLength));
    if (inputFormatters != null) {
      formaters.addAll(inputFormatters!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label != null ? NxText(label ?? '') : Container(),
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(icon, color: Colors.black87, size: 18),
                    )
                  : Container(),
              Expanded(
                child: TextFormField(
                  inputFormatters: formaters,
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: inputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  onChanged: onChanged,
                  keyboardType: inputType,
                  cursorColor: Colors.black54,
                  enabled: enable,
                  readOnly: readOnly,
                  autofocus: autofocus,
                  style: TextStyle(
                    color: enable ? Colors.black87 : Colors.grey,
                    fontWeight: fontWeight,
                  ),
                  obscureText: isObsecure,
                  validator: validator,
                  decoration: InputDecoration.collapsed(
                    hintText: textHint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
              suffix != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: suffixClicked,
                      child: Icon(suffix, color: Colors.black54))
                  : Container()
            ],
          ),
        ),
        validatorText != null && validatorText != ""
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[100],
                child: NxText(
                  validatorText!,
                  color: NxColor.error,
                ))
            : Container(),
        Divider(),
        textError != "" && textError != null
            ? NxText(
                textError!,
                color: NxColor.error,
              )
            : Container()
      ],
    );
  }
}

class TextAreaBorderBottom extends StatelessWidget {
  const TextAreaBorderBottom({
    Key? key,
    this.icon,
    this.suffix,
    this.maxLength = 100,
    this.maxLines = 10,
    this.minLines = 1,
    this.isObsecure = false,
    this.label,
    this.textHint,
    this.textError,
    this.validatorText = "",
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.inputAction,
    this.fontWeight,
    this.onFieldSubmitted,
    this.enable = true,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.padding,
    this.margin,
    this.borderBottom = true,
    this.color = Colors.transparent,
    this.inputFormatters
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label, textHint, validatorText, textError;
  final IconData? icon;
  final IconData? suffix;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool isObsecure;
  final bool enable;
  final bool autofocus;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool borderBottom;
  final double? padding;
  final double? margin;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formaters = [];
    formaters.add(LengthLimitingTextInputFormatter(maxLength));
    if (inputFormatters != null) {
      formaters.addAll(inputFormatters!);
    }
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderColor != null ? 1 : 0),
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label != null ? NxText(label!) : Container(),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(icon, color: Colors.black87, size: 18),
                      )
                    : Container(),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.black54,
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                    inputFormatters: formaters,
                    controller: controller,
                    focusNode: focusNode,
                    textInputAction: inputAction,
                    onFieldSubmitted: onFieldSubmitted,
                    onChanged: onChanged,
                    onTap: onTap,
                    enabled: enable,
                    autofocus: autofocus,
                    maxLines: maxLines,
                    minLines: minLines,
                    obscureText: isObsecure,
                    validator: validator,
                    decoration: InputDecoration.collapsed(
                      hintText: textHint,
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Colors.black38, fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          ),
          borderBottom ? Divider() : Container(),
          textError != "" && textError != null
              ? NxText(
                  textError!,
                  color: NxColor.error,
                )
              : Container()
        ]
      ),
    );
  }
}

class SelectionBorderBottom extends StatelessWidget {
  const SelectionBorderBottom({
    Key? key,
    this.icon,
    this.text,
    this.isLoading = false,
    this.label,
    this.textError,
    this.isSelected = false,
    this.suffix,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.height,
    this.padding,
    this.margin,
    this.borderBottom = true,
    this.color = Colors.transparent,
    this.onTap
  }) : super(key: key);

  final String? label;
  final String? textError;
  final Widget? icon;
  final bool isLoading;
  final String? text;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? suffix;
  final bool borderBottom;
  final double? height;
  final double? padding;
  final double? margin;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 0),
        margin: EdgeInsets.all(margin ?? 0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderColor != null ? 1 : 0),
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) label != null ? NxText(label!) : Container()
            else Container(),
            Container(
              height: height ?? 40,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderBottom ? Colors.grey[300]! : Colors.transparent, width: borderBottom ? 1 : 0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (icon != null)
                    Padding(padding: const EdgeInsets.only(right: 16), child: icon)
                  else
                    Container(),
                  Expanded(
                    child: Text(
                      isLoading ? 'Loading' : (text ?? ''),
                      style: TextStyle(
                        color: isLoading || !isSelected ? Colors.grey : Colors.black87,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  Icon(suffix ?? Icons.arrow_drop_down)
                ],
              ),
            ),
            textError != "" && textError != null
                ? NxText(
                    textError!,
                    color: NxColor.error,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
