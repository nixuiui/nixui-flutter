import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_text.dart';

class _NxTextFormFieldBasic<T> extends StatelessWidget {

  final Widget? label;
  final double? labelSpace;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor, borderColor;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText, validatorText;
  final Color? textColor, hintColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget? prefix, suffix;
  final EdgeInsetsGeometry? prefixPadding, suffixPadding;
  final VoidCallback? suffixClicked;
  final bool obsecure, enable, readonly;
  final Widget? errorIcon, successIcon;
  final String errorText, successText;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<BoxShadow>? boxShadow;
  final int? maxLines, minLines;
  final double? lineHeight;
  final MainAxisAlignment? valign;
  final bool? underlineBordered;
  final bool? isStepper;
  final bool? isDropdown;
  final List<T>? dropdownItems;
  final T? dropdownValue;
  final String Function(T)? dropdownValueLabel;
  final Function(T?)? dropdownOnChanged;
  final Function()? onTap;
  
  const _NxTextFormFieldBasic({
    Key? key,
    this.label,
    this.labelSpace,
    this.padding,
    this.prefix,
    this.prefixPadding,
    this.suffix,
    this.suffixPadding,
    this.suffixClicked,
    this.errorIcon,
    this.successIcon,
    this.obsecure = false,
    this.hintText = '',
    this.errorText = '',
    this.successText = '',
    this.validatorText = '',
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.borderRadius = 8,
    this.backgroundColor,
    this.underlineBordered = false,
    this.borderColor,
    this.textColor,
    this.hintColor,
    this.inputFormatters,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.enable = true,
    this.readonly = false,
    this.onChanged,
    this.boxShadow,
    this.maxLines = 1,
    this.minLines,
    this.lineHeight,
    this.valign,
    this.isStepper = false,
    this.isDropdown,
    this.dropdownItems,
    this.dropdownValue,
    this.dropdownValueLabel,
    this.dropdownOnChanged,
    this.onTap,
  }) :  assert(successText == '' || errorText ==''), 
        super(key: key);

  EdgeInsetsGeometry get getPadding {
    var defaultPadding = (underlineBordered ?? false) 
        ? EdgeInsets.symmetric(vertical: 12) 
        : EdgeInsets.symmetric(vertical: 12, horizontal: 16);
    
    if(isDropdown ?? false) {
      defaultPadding = (underlineBordered ?? false) 
          ? EdgeInsets.symmetric(vertical: 7) 
          : EdgeInsets.symmetric(vertical: 7, horizontal: 16);
    }
    
    var padding = this.padding ?? defaultPadding;

    return padding;
  }

  TextStyle textStyle({Color? color}) {
    var lineHeight = this.lineHeight ?? (inputType == TextInputType.multiline ? 1.5 : 1);

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
    );
  }

  InputBorder border({Color? color}) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: color ?? Colors.grey[300]!,
      ),
    );

    if(underlineBordered ?? false) {
      border = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: color ?? Colors.grey[300]!,
        ),
      );
    }

    return border;
  }

  Color get getBorderColor {
    var borderColor = this.borderColor ?? Colors.grey[300]!;
    if(errorText != '') {
      borderColor = NxColor.error;
    }
    return borderColor;
  }

  Widget? get prefixIcon {
    var prefix = this.prefix;
    var prefixPadding = this.prefixPadding ?? EdgeInsets.symmetric(horizontal: getPadding.horizontal/2);

    return prefix != null ? Padding(
      padding: prefixPadding,
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: textColor,
            size: fontSize,
          )
        ), 
        child: prefix
      ),
    ) : null;
  }
  
  Widget? get suffixIcon {
    var suffix = this.suffix;
    var suffixPadding = this.suffixPadding ?? EdgeInsets.symmetric(horizontal: getPadding.horizontal/2);

    if(isStepper ?? false) {
      suffix = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => changeStepperValue(1),
            child: Icon(Icons.arrow_drop_up),
          ),
          GestureDetector(
            onTap: () => changeStepperValue(-1),
            child: Icon(Icons.arrow_drop_down),
          ),
        ],
      );
    } else if(isDropdown ?? false) {
      suffix ??= Icon(Icons.keyboard_arrow_down_rounded);
    }

    return suffix != null ? Padding(
      padding: suffixPadding,
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: textColor,
            size: fontSize,
          )
        ), 
        child: suffix
      ),
    ) : null;
  }

  List<TextInputFormatter>? get getInputFormatters {
    List<TextInputFormatter>? formaters = inputFormatters;

    if(isStepper ?? false) formaters = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];

    return formaters;
  }

  void changeStepperValue(int increment) {
    var currentValue = int.tryParse(controller?.text ?? '') ?? 0;
    currentValue += increment;
    controller?.text = currentValue.toString();
    onChanged?.call(controller?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {

    var backgroundColor = this.backgroundColor;
    var textColor = this.textColor ?? Colors.black87;
    var hintColor = this.hintColor?? textColor.withOpacity(0.5);

    var labelSpace = this.labelSpace ?? 8;

    if(!enable) {
      textColor = Colors.grey;
      backgroundColor = Colors.grey[100];
    }
    
    if(readonly) {
      textColor = this.textColor ?? Colors.black87;
    }

    var inputDecoration = InputDecoration(
      contentPadding: getPadding,
      isCollapsed: true,
      hintText: hintText,
      border: border(color: getBorderColor),
      focusedBorder: border(color: NxColor.primary),
      enabledBorder: border(color: getBorderColor),
      hintStyle: textStyle(color: hintColor),
      prefixIconConstraints: BoxConstraints(maxWidth: 100),
      prefixIcon: prefixIcon,
      suffixIconConstraints: BoxConstraints(maxWidth: 100),
      suffixIcon: suffixIcon,
    );

    Widget formField = TextFormField(
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      textInputAction: inputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: getInputFormatters,
      cursorColor: textColor,
      enabled: enable,
      readOnly: readonly,
      onChanged: onChanged,
      style: textStyle(color: textColor),
      obscureText: obsecure,
      keyboardType: inputType,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      decoration: inputDecoration,
    );

    if(isDropdown ?? false) {
      formField = DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: dropdownValue,
          icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
          style: textStyle(color: textColor),
          decoration: inputDecoration,
          hint: Text(
            hintText,
            style: textStyle(color: hintColor),
          ),
          isExpanded: true,
          isDense: true,
          onChanged: enable ? dropdownOnChanged?.call : null,
          items: dropdownItems?.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Expanded(
                child: Text(
                  dropdownValueLabel != null ? dropdownValueLabel!(value) : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle(color: textColor),
                ),
              ),
            );
          }).toList() ?? [],
          focusNode: focusNode,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: valign ?? MainAxisAlignment.center,
      children: <Widget>[
        (label != null) ? Container(
          padding: EdgeInsets.only(bottom: labelSpace),
          child: label,
        ) : SizedBox(),
        Theme(
          data: ThemeData(
            
          ), 
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              boxShadow: boxShadow,
            ),
            child: formField,
          ),
        ),

        // Error Text
        (errorText != '') ? Container(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(errorIcon != null) Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: NxColor.error.dark,
                      size: fontSize,
                    )
                  ), 
                  child: errorIcon!
                ),
              ),
              NxText.extraSmall(
                errorText,
                color: NxColor.error.dark,
              ),
            ],
          ),
        ) : SizedBox(),

        // Success Text
        (successText != '') ? Container(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(successIcon != null) Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: NxColor.success.dark,
                      size: fontSize,
                    )
                  ), 
                  child: successIcon!
                ),
              ),
              NxText.extraSmall(
                successText,
                color: NxColor.success.dark,
              ),
            ],
          ),
        ) : SizedBox(),
      ],
    );
  }

}

class NxTextFormField<T> extends _NxTextFormFieldBasic<T> {

  const NxTextFormField({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.prefix,
    super.prefixPadding,
    super.suffix,
    super.suffixPadding,
    super.suffixClicked,
    super.errorIcon,
    super.successIcon,
    super.obsecure,
    super.hintText,
    super.errorText,
    super.successText,
    super.validatorText,
    super.inputType,
    super.controller,
    super.validator,
    super.backgroundColor,
    super.borderColor,
    super.textColor,
    super.hintColor,
    super.inputFormatters,
    super.fontSize,
    super.fontWeight,
    super.inputAction,
    super.onFieldSubmitted,
    super.focusNode,
    super.enable,
    super.readonly,
    super.onChanged,
    super.boxShadow,
    super.maxLines,
    super.minLines,
    super.lineHeight,
    super.valign,
    super.underlineBordered,
    super.onTap,
  }) : super();

  const NxTextFormField.dropdownList({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.prefix,
    super.prefixPadding,
    super.suffix,
    super.suffixPadding,
    super.errorIcon,
    super.successIcon,
    super.obsecure,
    super.hintText,
    super.errorText,
    super.successText,
    super.backgroundColor,
    super.borderColor,
    super.textColor,
    super.hintColor,
    super.fontSize,
    super.fontWeight,
    super.focusNode,
    super.enable,
    super.boxShadow,
    super.underlineBordered,
    List<T>? items,
    T? value,
    String Function(T)? valueLabel,
    Function(T?)? onChanged,
  }) : super(
    isDropdown: true,
    dropdownValue: value,
    dropdownItems: items,
    dropdownValueLabel: valueLabel,
    dropdownOnChanged: onChanged,
  );
  
  const NxTextFormField.stepper({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.suffixPadding,
    super.errorIcon,
    super.successIcon,
    super.obsecure,
    super.hintText,
    super.errorText,
    super.successText,
    super.validatorText,
    super.controller,
    super.validator,
    super.backgroundColor,
    super.borderColor,
    super.textColor,
    super.hintColor,
    super.fontSize,
    super.fontWeight,
    super.inputAction,
    super.onFieldSubmitted,
    super.focusNode,
    super.enable,
    super.readonly,
    super.onChanged,
    super.boxShadow,
    super.maxLines,
    super.minLines,
    super.lineHeight,
    super.valign,
    super.underlineBordered
  }) : super(
    isStepper: true,
    inputType: TextInputType.number,
  );

  const NxTextFormField.multiLine({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.errorIcon,
    super.successIcon,
    super.obsecure,
    super.hintText,
    super.errorText,
    super.successText,
    super.validatorText,
    super.controller,
    super.validator,
    super.backgroundColor,
    super.borderColor,
    super.textColor,
    super.hintColor,
    super.inputFormatters,
    super.fontSize,
    super.fontWeight,
    super.focusNode,
    super.enable,
    super.readonly,
    super.onChanged,
    super.boxShadow,
    super.maxLines = 6,
    super.minLines = 3,
    super.lineHeight,
    super.underlineBordered
  }) : super(
    inputType: TextInputType.multiline,
  );

}