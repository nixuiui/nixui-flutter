import 'package:flutter/material.dart';

class NxCard extends StatelessWidget {

  final Widget? child;
  final Widget? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const NxCard({ 
    Key? key,
    this.child,
    this.title,
    this.actions,
    this.padding,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      child: ListView(
        padding: padding ?? EdgeInsets.all(16),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(title != null) Container(
                margin: EdgeInsets.only(bottom: child != null ? 16 : 0),
                child: title,
              ),
              if(actions != null) Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: child != null ? 16 : 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions ?? [],
                  ),
                ),
              ),
            ],
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}