import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nixui.dart';

enum NxDialogType { confirmation, custom, information, loader }
enum ActionsDirection { ltr, rtl }

class _NxDialogBase extends StatelessWidget {
  
  final NxDialogType? dialogType;
  final Widget? illustration;
  final String? title;
  final String? description;
  final TextAlign? textAlign;
  final String? confirmLabel;
  final Color? confirmLabelColor;
  final Color? confirmButtonColor;
  final String? cancelLabel;
  final Color? cancelLabelColor;
  final Color? cancelButtonColor;
  final Function(bool)? onConfirmed;

  const _NxDialogBase({ 
    Key? key,
    this.dialogType,
    this.illustration,
    this.title,
    this.description,
    this.textAlign,
    this.confirmLabel,
    this.confirmLabelColor,
    this.confirmButtonColor,
    this.cancelLabel,
    this.cancelLabelColor,
    this.cancelButtonColor,
    this.onConfirmed,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Widget actionWidget = NxButton(
      text: confirmLabel ?? 'OK',
      textColor: confirmLabelColor,
      width: MediaQuery.of(context).size.width,
      color: confirmButtonColor,
      onPressed: () => onConfirmed?.call(true),
    );

    if(dialogType == NxDialogType.confirmation) {
      actionWidget = Row(
        children: [
          Expanded(
            child: NxButton(
              text: cancelLabel ?? 'Cancel',
              textColor: cancelLabelColor,
              width: MediaQuery.of(context).size.width,
              color: cancelButtonColor,
              onPressed: () => onConfirmed?.call(false),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: NxButton(
              text: confirmLabel ?? 'OK',
              textColor: confirmLabelColor,
              width: MediaQuery.of(context).size.width,
              color: confirmButtonColor,
              onPressed: () => onConfirmed?.call(true),
            ),
          ),
        ],
      );
    } else if(dialogType == NxDialogType.loader) {
      actionWidget = NxLoadingSpinner(
        valueColor: NxColor.primary,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NxBox(
          color: Colors.white,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(24),
          width: double.infinity,
          borderRadius: 16,
          child: Column(
            children: [
              if(illustration != null) Container(
                margin: EdgeInsets.only(bottom: 16),
                child: illustration,
              ),
              if((title ?? '') != '') Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 16),
                child: NxText(
                  title!,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  textAlign: textAlign ?? TextAlign.center,
                ),
              ),
              if((description ?? '') != '') Container(
                margin: EdgeInsets.only(bottom: 16),
                child: NxText(
                  description!,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  textAlign: textAlign ?? TextAlign.center,
                ),
              ),
              actionWidget,
            ],
          ),
        ),
      ],
    );
  }
}

class NxDialog extends _NxDialogBase {

  const NxDialog.information({
    super.key,
    super.illustration,
    super.title,
    super.description,
    super.textAlign,
    super.confirmLabel,
    super.confirmLabelColor,
    super.confirmButtonColor,
    super.onConfirmed,
  }) : super(
    dialogType: NxDialogType.information,
  );

  const NxDialog.confirmation({
    super.key,
    super.illustration,
    super.title,
    super.description,
    super.textAlign,
    super.confirmLabel,
    super.confirmLabelColor,
    super.confirmButtonColor,
    super.cancelLabel,
    super.cancelLabelColor,
    super.cancelButtonColor,
    super.onConfirmed,
  }) : super(
    dialogType: NxDialogType.confirmation,
  );

  const NxDialog.loader({
    super.key,
    super.illustration,
    super.title,
    super.description,
    super.textAlign,
  }) : super(
    dialogType: NxDialogType.loader,
  );
  
}