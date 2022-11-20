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

    var color = this.color ?? NxColor.primary;
    var textColor =  this.textColor ?? Colors.white;
    var iconColor = this.iconColor ?? textColor;
    var borderColor = this.borderColor ?? color;

    if(outlined) {
      textColor =  this.textColor ?? color;
      iconColor = this.iconColor ?? textColor;
      borderColor = this.borderColor ?? color;
      color = Colors.white;
    }

    var fontSize = this.fontSize ?? Theme.of(context).textTheme.bodyText1!.fontSize!;
    var fontWeight = this.fontWeight ?? Theme.of(context).textTheme.bodyText1!.fontWeight!;
    
    var defaultPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 12);
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
              borderRadius: BorderRadius.circular(radius ?? 6),
              side: BorderSide(
                color: !enabled ? borderColor.light : borderColor, 
                width: 1
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
    fontSize: 10,
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  );
  
  NxButton.medium({
    super.key,
    super.text,
    super.fontWeight,
    super.onPressed,
    super.width,
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
    fontSize: 14,
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
  );
  
  NxButton.large({
    super.key,
    super.text,
    super.fontWeight,
    super.onPressed,
    super.width,
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
    fontSize: 18,
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  );
  
  const NxButton.square({
    super.key,
    super.text,
    super.onPressed,
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
    width: size ?? 32,
    height: size ?? 32,
  );

}