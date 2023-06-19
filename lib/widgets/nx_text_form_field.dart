import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_text.dart';

enum NxInputType { 
  dropdown, 
  date, 
  time, 
  stepper, 
}

class _NxTextFormFieldBasic<T> extends StatelessWidget {

  final Widget? label;
  final double? labelSpace;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor, borderColor, focusedBorderColor;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final NxInputType? inputType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText, validatorText;
  final Color? textColor, hintColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Widget? prefix, suffix;
  final EdgeInsetsGeometry? prefixPadding, suffixPadding;
  final VoidCallback? prefixClicked, suffixClicked;
  final bool obsecure, enable, readonly;
  final Widget? errorIcon, successIcon;
  final String errorText, successText;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<BoxShadow>? boxShadow;
  final int? maxLines, minLines, maxLength;
  final double? lineHeight;
  final MainAxisAlignment? valign;
  final bool? underline;
  final List<T>? dropdownItems;
  final T? dropdownValue;
  final String Function(T)? dropdownValueText;
  final Function(T?)? dropdownOnChanged;
  final DateTime? initialDate, firstDate, lastDate;
  final Function(DateTime?)? dateChanged;
  final String Function(DateTime)? dateValueText;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay?)? timeChanged;
  final String Function(TimeOfDay)? timeValueText;
  final Function()? onTap;
  
  const _NxTextFormFieldBasic({
    Key? key,
    this.label,
    this.labelSpace,
    this.padding,
    this.prefix,
    this.prefixPadding,
    this.prefixClicked,
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
    this.keyboardType = TextInputType.text,
    this.inputType,
    this.controller,
    this.validator,
    this.borderRadius,
    this.backgroundColor,
    this.underline = false,
    this.borderColor,
    this.focusedBorderColor,
    this.textColor,
    this.textAlign,
    this.hintColor,
    this.inputFormatters,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.enable = true,
    this.readonly = false,
    this.onChanged,
    this.boxShadow,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.lineHeight,
    this.valign,
    this.dropdownItems,
    this.dropdownValue,
    this.dropdownValueText,
    this.dropdownOnChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateChanged,
    this.dateValueText,
    this.initialTime,
    this.timeChanged,
    this.timeValueText,
    this.onTap,
  }) :  assert(successText == '' || errorText ==''), 
        super(key: key);

  EdgeInsetsGeometry get getPadding {
    var defaultPadding = (underline ?? false) 
        ? NxInputFieldTheme.underlinedPadding 
        : NxInputFieldTheme.padding;
    
    if(inputType == NxInputType.dropdown) {
      defaultPadding = (underline ?? false) 
          ? NxInputFieldTheme.dropdownUnderlinedPadding 
          : NxInputFieldTheme.dropdownPadding;
    }
    
    var padding = this.padding ?? defaultPadding;

    return padding;
  }

  FontWeight get getFontWeight {
    return fontWeight ?? NxInputFieldTheme.fontWeight;
  }

  double get getFontSize {
    return fontSize ?? NxInputFieldTheme.fontSize;
  }

  double get getBorderRadius {
    if(underline == true) return 0;
    return borderRadius ?? NxInputFieldTheme.radius;
  }

  double get getLabelSpace {
    return labelSpace ?? NxInputFieldTheme.labelSpace;
  }

  TextStyle textStyle({Color? color}) {
    var lineHeight = this.lineHeight ?? (keyboardType == TextInputType.multiline ? 1.5 : 1);
    var fontFamily = this.fontFamily ?? NxInputFieldTheme.fontFamily;

    return TextStyle(
      color: color,
      fontSize: getFontSize,
      fontWeight: getFontWeight,
      height: lineHeight,
      fontFamily: fontFamily,
    );
  }

  InputBorder border({required Color color}) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(getBorderRadius),
      borderSide: BorderSide(
        color: color,
      ),
    );

    if(underline ?? false) {
      border = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(getBorderRadius),
        borderSide: BorderSide(
          color: color,
        ),
      );
    }

    return border;
  }

  Color get getBorderColor {
    var borderColor = this.borderColor ?? NxInputFieldTheme.color.border!;
    if(errorText != '') {
      borderColor = NxColor.error;
    }
    return borderColor;
  }

  Color get getFocusedBorderColor {
    var focusedBorderColor = this.focusedBorderColor ?? NxColor.primary;
    return focusedBorderColor;
  }

  Widget? get prefixIcon {
    var prefix = this.prefix;
    var padding = EdgeInsets.symmetric(horizontal: getPadding.horizontal/2);
    if(underline ?? false) padding = const EdgeInsets.only(right: 12);
    var prefixPadding = this.prefixPadding ?? padding;

    if(prefixClicked != null) {
      prefix = GestureDetector(
        onTap: prefixClicked,
        child: prefix,
      );
    }

    return prefix != null ? Padding(
      padding: prefixPadding,
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: NxInputFieldTheme.color.prefix,
            size: NxInputFieldTheme.iconSize,
          ),
        ), 
        child: prefix
      ),
    ) : null;
  }
  
  Widget? get suffixIcon {
    var suffix = this.suffix;
    var padding = EdgeInsets.symmetric(horizontal: getPadding.horizontal/2);
    if(underline ?? false) padding = const EdgeInsets.only(right: 12);
    var suffixPadding = this.suffixPadding ?? padding;

    if(suffixClicked != null) {
      suffix = GestureDetector(
        onTap: suffixClicked,
        child: suffix,
      );
    }

    if(inputType == NxInputType.stepper) {
      suffix = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => changeStepperValue(1),
            child: const Icon(Icons.expand_less),
          ),
          GestureDetector(
            onTap: () => changeStepperValue(-1),
            child: const Icon(Icons.expand_more),
          ),
        ],
      );
    } else if(inputType == NxInputType.dropdown) {
      suffix ??= const Icon(Icons.keyboard_arrow_down_rounded);
    }

    return suffix != null ? Padding(
      padding: suffixPadding,
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: NxInputFieldTheme.color.suffix,
            size: getFontSize,
          ),
        ), 
        child: suffix
      ),
    ) : null;
  }

  List<TextInputFormatter>? get getInputFormatters {
    List<TextInputFormatter>? formaters = inputFormatters;

    if(inputType == NxInputType.stepper) formaters = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];

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

    var backgroundColorDefault = NxInputFieldTheme.color.background;
    if(underline ?? false) backgroundColorDefault = Colors.transparent;
    var backgroundColor = this.backgroundColor ?? backgroundColorDefault;

    var textColor = this.textColor ?? NxInputFieldTheme.color.text;
    var hintColor = this.hintColor?? NxInputFieldTheme.color.hintText;

    if(!enable) {
      textColor = NxInputFieldTheme.color.disabledText;
      backgroundColor = NxInputFieldTheme.color.disabledBackground;
    }
    
    if(readonly) {
      textColor = this.textColor ?? Colors.black87;
    }

    var onTap = this.onTap;
    var controller = this.controller;
    
    var date = initialDate;
    if(inputType == NxInputType.date) {
      var dateString = '';
      if(date != null) {
        dateString = '${date.year}/${date.month}/${date.day}';
        if(dateValueText != null) {
          dateString = dateValueText != null ? dateValueText!(date) : '';
        }
      }

      controller = TextEditingController()..text = dateString;
      onTap = () async {
        final newDate = await _getDate(context, date);
        dateChanged?.call(newDate);
      };
    }

    var time = initialTime;
    if(inputType == NxInputType.time) {
      var timeString = '';
      if(time != null) {
        timeString = '${time.hour}:${time.minute}';
        if(timeValueText != null) {
          timeString = timeValueText != null ? timeValueText!(time) : '';
        }
      }

      controller = TextEditingController()..text = timeString;
      onTap = () async {
        final newTime = await _getTime(context, time);
        timeChanged?.call(newTime);
      };
    }

    var textAlign = this.textAlign ?? TextAlign.start;

    var errorIcon = this.errorIcon ?? NxInputFieldTheme.errorIcon;
    var successIcon = this.successIcon ?? NxInputFieldTheme.successIcon;

    var inputDecoration = InputDecoration(
      contentPadding: getPadding,
      isCollapsed: true,
      hintText: hintText,
      border: border(color: getBorderColor),
      focusedBorder: border(color: getFocusedBorderColor),
      enabledBorder: border(color: getBorderColor),
      disabledBorder: border(color: getBorderColor),
      errorBorder: border(color: getBorderColor),
      hintStyle: textStyle(color: hintColor),
      prefixIconConstraints: const BoxConstraints(maxWidth: 100),
      prefixIcon: prefixIcon,
      suffixIconConstraints: const BoxConstraints(maxWidth: 100),
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
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      decoration: inputDecoration,
      textAlign: textAlign,
    );

    if(inputType == NxInputType.dropdown) {
      formField = DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: dropdownValue,
          icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
          style: textStyle(color: textColor),
          decoration: inputDecoration,
          hint: Text(
            hintText,
            style: textStyle(color: hintColor),
            textAlign: textAlign,
          ),
          isExpanded: true,
          isDense: true,
          onChanged: enable ? dropdownOnChanged?.call : null,
          items: dropdownItems?.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(
                dropdownValueText != null ? dropdownValueText!(value) : '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle(color: textColor),
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
          padding: EdgeInsets.only(bottom: getLabelSpace),
          child: label,
        ) : const SizedBox(),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(getBorderRadius),
            boxShadow: NxInputFieldTheme.boxShadow,
          ),
          child: formField,
        ),

        // Error Text
        (errorText != '') ? Container(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(errorIcon != null) Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: NxColor.error.dark,
                      size: getFontSize,
                    )
                  ), 
                  child: errorIcon
                ),
              ),
              NxText.extraSmall(
                errorText,
                color: NxColor.error.dark,
              ),
            ],
          ),
        ) : const SizedBox(),

        // Success Text
        (successText != '') ? Container(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(successIcon != null) Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: NxColor.success.dark,
                      size: getFontSize,
                    )
                  ), 
                  child: successIcon
                ),
              ),
              NxText.extraSmall(
                successText,
                color: NxColor.success.dark,
              ),
            ],
          ),
        ) : const SizedBox(),
      ],
    );
  }

  Future<DateTime?> _getDate(BuildContext context, DateTime? initialDate) async {
    final picker = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: NxColor.primary)
          ),
          child: child!,
        );
      }
    );

    return picker;
  }

  Future<TimeOfDay?> _getTime(BuildContext context, TimeOfDay? initialTime) async {
    final picker = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: NxColor.primary)
          ),
          child: child!,
        );
      }
    );

    return picker;
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
    super.prefixClicked,
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
    super.keyboardType,
    super.controller,
    super.validator,
    super.backgroundColor,
    super.borderColor,
    super.textColor,
    super.hintColor,
    super.textAlign,
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
    super.maxLength,
    super.lineHeight,
    super.valign,
    super.underline,
    super.onTap,
    super.fontFamily,
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
    super.textAlign,
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
    super.underline,
    super.fontFamily,
    List<T>? items,
    T? value,
    required String Function(T)? valueLabel,
    Function(T?)? onChanged,
  }) : super(
    inputType: NxInputType.dropdown,
    dropdownValue: value,
    dropdownItems: items,
    dropdownValueText: valueLabel,
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
    super.fontFamily,
    super.underline
  }) : super(
    inputType: NxInputType.stepper,
    keyboardType: TextInputType.number,
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
    super.fontFamily,
    super.underline
  }) : super(
    keyboardType: TextInputType.multiline,
  );

  const NxTextFormField.date({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.prefix = const Icon(Icons.calendar_month),
    super.prefixPadding,
    super.prefixClicked,
    super.suffix,
    super.suffixPadding,
    super.suffixClicked,
    super.errorIcon,
    super.successIcon,
    super.hintText,
    super.textAlign,
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
    Function(DateTime?)? onChanged,
    super.initialDate,
    super.firstDate,
    super.lastDate,
    super.dateValueText,
    super.boxShadow,
    super.fontFamily,
    super.underline,
  }) : super(
    readonly: true,
    dateChanged: onChanged,
    inputType: NxInputType.date,
  );

  const NxTextFormField.time({
    super.key,
    super.label,
    super.labelSpace,
    super.borderRadius,
    super.padding,
    super.prefix = const Icon(Icons.schedule),
    super.prefixPadding,
    super.prefixClicked,
    super.suffix,
    super.suffixPadding,
    super.suffixClicked,
    super.errorIcon,
    super.successIcon,
    super.hintText,
    super.textAlign,
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
    Function(TimeOfDay?)? onChanged,
    super.initialTime,
    super.timeValueText,
    super.boxShadow,
    super.fontFamily,
    super.underline,
  }) : super(
    readonly: true,
    timeChanged: onChanged,
    inputType: NxInputType.time,
  );

}