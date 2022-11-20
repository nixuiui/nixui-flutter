import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_options.dart';
import 'package:nixui/widgets/nx_select_option.dart';

class NxOptionsSelector extends StatelessWidget {
  const NxOptionsSelector({
    Key? key,
    this.options,
    this.selected,
    this.onSelected,
    this.child,
    this.useFilter = false,
    this.multipleSelect = false,
    this.label,
  }) : super(key: key);

  final List<NxOptions>? options;
  final dynamic selected;
  final ValueChanged<dynamic>? onSelected;
  final Widget? child;
  final bool useFilter;
  final bool multipleSelect;
  final String? label;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select(context),
      child: child,
    );
  }

  Future select(BuildContext context) async {
    final Map? results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NxSelectOptions(
        title: 'Select ${label?.toLowerCase() ?? ''}',
        options: options ?? [],
        selected: selected,
        useFilter: useFilter,
        multipleSelect: multipleSelect,
      )),
    );

    if (results != null && results.containsKey('data')) {
      onSelected?.call(results['data']);
    }
  }
}