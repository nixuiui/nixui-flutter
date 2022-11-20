import 'package:flutter/material.dart';

class NxSelectableList extends StatefulWidget {

  final IndexedWidgetBuilder itemBuilder;
  final Axis direction;
  final int itemCount;
  final int? selected;
  final double? space;
  final EdgeInsetsGeometry? padding;
  
  const NxSelectableList({ 
    Key? key,
    required this.itemBuilder,
    required this.direction,
    required this.itemCount,
    this.selected,
    this.space,
    this.padding,
  }) : super(key: key);

  @override
  State<NxSelectableList> createState() => _NxSelectableListState();
}

class _NxSelectableListState extends State<NxSelectableList> {

  final dataKey = <GlobalKey<State<StatefulWidget>>>[];

  @override
  void initState() {
    for (var i = 0; i < widget.itemCount; i++) {
      dataKey.add(GlobalKey());
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _updatePosition()
    );
  }

  @override
  void didUpdateWidget(covariant NxSelectableList oldWidget) {
    _updatePosition();
    super.didUpdateWidget(oldWidget);
  }

  void _updatePosition() {
    if((widget.selected ?? -1) > -1) {
      Scrollable.ensureVisible(
        dataKey[widget.selected!].currentContext!,
        duration: Duration(milliseconds: 500),
        alignment: 0.5
      );
    }
  }

  Widget _itemListHorizontal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.itemCount, (index) {
        return Container(
          key: dataKey[index],
          margin: index > 0 ? EdgeInsets.only(left: widget.space ?? 0) : null,
          child: widget.itemBuilder(context, index),
        );
      })
    );
  }
  
  Widget _itemListVertical() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.itemCount, (index) {
        return Container(
          key: dataKey[index],
          margin: index > 0 ? EdgeInsets.only(top: widget.space ?? 0) : null,
          child: widget.itemBuilder(context, index),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: widget.direction,
      padding: widget.padding,
      child: widget.direction == Axis.horizontal ? _itemListHorizontal() : _itemListVertical()
    );
  }
}