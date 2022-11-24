import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_loading_spinner.dart';

class _NxButtonBasic extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? borderSize;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double? elevation;
  final double? radius;
  final bool isLoading;
  final bool outlined;
  final Widget? child;

  const _NxButtonBasic({
    Key? key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
    this.width,
    this.height,
    this.borderSize,
    this.padding,
    this.color,
    this.borderColor,
    this.iconColor,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.elevation = 0,
    this.radius,
    this.isLoading = false,
    this.outlined = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var color = this.color ?? NxButtonTheme.color.background!;
    var textColor =  this.textColor ?? NxButtonTheme.color.text!;
    var iconColor = this.iconColor ?? NxButtonTheme.color.icon!;
    var borderColor = this.borderColor ?? (this.color ?? NxButtonTheme.color.border!);

    if(outlined) {
      textColor =  this.textColor ?? color;
      iconColor = this.iconColor ?? textColor;
      borderColor = this.borderColor ?? color;
      color = NxButtonTheme.color.text!;
    }

    var fontSize = this.fontSize ?? NxButtonTheme.fontSize;
    var fontWeight = this.fontWeight ?? NxButtonTheme.fontWeight;
    var borderSize = this.borderSize ?? NxButtonTheme.borderSize;
    var radius = this.radius ?? NxButtonTheme.radius;
    
    var defaultPadding = NxButtonTheme.padding;
    var padding = this.padding ?? defaultPadding;
    
    var itemSpace = padding.horizontal/4;

    var enabled = true;
    if(isLoading) enabled = false;
    if(onPressed == null) enabled = false;
    
    return SizedBox(
      width: width,
      height: height,
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: iconColor,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: textColor
            )
          ),
        ),
        child: ElevatedButton(
          clipBehavior: Clip.antiAlias,
          onPressed: !enabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            elevation: elevation,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(
                color: !enabled ? borderColor.light : borderColor, 
                width: borderSize
              ),
            ),
            textStyle: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            padding: padding,
            backgroundColor: color,
            foregroundColor: color.dark,
            disabledBackgroundColor: color.light,
            splashFactory: NoSplash.splashFactory,
          ),
          child: isLoading 
              ? NxLoadingSpinner(
                  size: fontSize,
                  valueColor: textColor,
                  backgroundColor: color,
                ) 
              : (child != null) 
                    ? Center(
                        child: Theme(
                          data: ThemeData(
                            iconTheme: IconThemeData(
                              color: iconColor,
                              size: fontSize,
                            ),
                          ), 
                          child: child!
                        ),
                      )
                    : Row(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          leftIcon != null ? Theme(
                            data: ThemeData(
                              iconTheme: IconThemeData(
                                color: iconColor,
                                size: fontSize,
                              )
                            ), 
                            child: leftIcon!
                          ) : SizedBox.shrink(),

                          if(text != null) Container(
                            margin: EdgeInsets.only(
                              left: leftIcon != null ? itemSpace : 0,
                              right: rightIcon != null ? itemSpace : 0,
                            ),
                            child: Text(
                              text ?? '',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: textColor,
                                fontSize: fontSize,
                                fontWeight: fontWeight,
                              ),
                            ),
                          ),

                          rightIcon != null ? Theme(
                            data: ThemeData(
                              iconTheme: IconThemeData(
                                color: iconColor,
                                size: fontSize,
                              )
                            ), 
                            child: rightIcon!
                          ) : SizedBox.shrink(),

                        ],
                      ),
        ),
      ),
    );
  }
}

class NxButton extends _NxButtonBasic {

  const NxButton({
    super.key,
    super.text,
    super.fontSize,
    super.fontWeight,
    super.onPressed,
    super.width,
    super.padding,
    super.borderSize,
    super.color,
    super.borderColor,
    super.iconColor,
    super.textColor,
    super.leftIcon,
    super.rightIcon,
    super.elevation,
    super.radius,
    super.isLoading,
    super.outlined,
  });
  
  NxButton.small({
    super.key,
    super.text,
    super.fontWeight,
    super.onPressed,
    super.width,
    super.borderSize,
    super.color,
    super.borderColor,
    super.iconColor,
    super.textColor,
    super.leftIcon,
    super.rightIcon,
    super.elevation,
    super.radius = 4,
    super.isLoading,
    super.outlined,
  }) : super(
    fontSize: NxButtonTheme.fontSizeSmallButton,
    padding: NxButtonTheme.paddingSmallButton,
  );
  
  NxButton.medium({
    super.key,
    super.text,
    super.fontWeight,
    super.onPressed,
    super.width,
    super.borderSize,
    super.color,
    super.borderColor,
    super.iconColor,
    super.textColor,
    super.leftIcon,
    super.rightIcon,
    super.elevation,
    super.radius = 6,
    super.isLoading,
    super.outlined,
  }) : super(
    fontSize: NxButtonTheme.fontSizeMediumButton,
    padding: NxButtonTheme.paddingMediumButton,
  );
  
  NxButton.large({
    super.key,
    super.text,
    super.fontWeight,
    super.onPressed,
    super.width,
    super.borderSize,
    super.color,
    super.borderColor,
    super.iconColor,
    super.textColor,
    super.leftIcon,
    super.rightIcon,
    super.elevation,
    super.radius = 10,
    super.isLoading,
    super.outlined,
  }) : super(
    fontSize: NxButtonTheme.fontSizeLargeButton,
    padding: NxButtonTheme.paddingLargeButton,
  );
  
  NxButton.square({
    super.key,
    super.text,
    super.onPressed,
    super.borderSize,
    super.color,
    super.borderColor,
    super.iconColor,
    super.textColor,
    super.elevation,
    super.radius,
    super.isLoading,
    super.outlined,
    super.child,
    double? size,
    super.padding = EdgeInsets.zero,
  }) : super(
    width: size ?? NxButtonTheme.squareButtonSize,
    height: size ?? NxButtonTheme.squareButtonSize,
  );

}