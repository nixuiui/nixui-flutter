import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_options.dart';

import 'nx_select_option.dart';
import 'nx_text_field.dart';

class NxSelectBox extends StatefulWidget {
  const NxSelectBox({
    Key? key,
    this.icon,
    this.useFilter = false,
    this.text,
    this.isLoading = false,
    this.label,
    this.textError,
    this.options,
    this.selected,
    this.suffix,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.height,
    this.padding,
    this.margin,
    this.borderBottom = true,
    this.multipleSelect = false,
    this.color = Colors.transparent,
    this.onSelected
  }) : super(key: key);

  final String? label;
  final String? textError;
  final Widget? icon;
  final bool useFilter;
  final bool isLoading;
  final String? text;
  final List<NxOptions>? options;
  final dynamic selected;
  final ValueChanged<dynamic>? onSelected;
  final IconData? suffix;
  final bool borderBottom;
  final bool multipleSelect;
  final double? height;
  final double? padding;
  final double? margin;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  @override
  _NxSelectBoxState createState() => _NxSelectBoxState();
}

class _NxSelectBoxState extends State<NxSelectBox> {
  @override
  Widget build(BuildContext context) {
    return SelectionBorderBottom(
      label: widget.label,
      textError: widget.textError,
      boxShadow: widget.boxShadow,
      icon: widget.icon,
      isLoading: widget.isLoading,
      text: widget.selected != null ? (
        widget.selected is NxOptions ? widget.selected?.name ?? "" : getListSelectedAsText()
      ) : (widget.text ?? "Select"),
      isSelected: widget.selected != null,
      suffix: widget.suffix,
      borderBottom: widget.borderBottom,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      borderRadius: widget.borderRadius,
      borderColor: widget.borderColor,
      color: widget.color,
      onTap: () => select(context),
    );
  }

  Future select(BuildContext context) async {
    final Map? results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NxSelectOptions(
        title: 'Select ${widget.label?.toLowerCase() ?? ''}',
        options: widget.options ?? [],
        selected: widget.selected,
        useFilter: widget.useFilter,
        multipleSelect: widget.multipleSelect,
      )),
    );

    if (results != null && results.containsKey('data')) {
      widget.onSelected?.call(results['data']);
    }
  }

  getListSelectedAsText() {
    var result = "";
    (widget.selected as List<NxOptions<dynamic>>).forEach((e) {
      if(result == "") result += e.name!;
      else result += ", ${e.name!}";
    });
    if(result == "") return widget.text ?? "Select";
    return result;
  }
}