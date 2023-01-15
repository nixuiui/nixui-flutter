import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class OptionSelectorScreen extends StatefulWidget {
  const OptionSelectorScreen({ Key? key }) : super(key: key);

  @override
  State<OptionSelectorScreen> createState() => _OptionSelectorScreenState();
}

class _OptionSelectorScreenState extends State<OptionSelectorScreen> {

  String? selected;
  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxOptionSelector Widget"),
      ),
      body: ListView(
        children: [
          NxOptionsSelector.multipleSelect(
            options: const [
              'Niki',
              'Rahmadi',
              'Wiharto',
            ],
            selected: selectedList,
            valueLabel: (v) => v,
            label: 'Select',
            onSelected: (val) {
              setState(() {
                selectedList = val;
              });
            },
            child: NxBox(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NxText('Multiple Select: **${selectedList.length}**'),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          Divider(),
          NxOptionsSelector(
            options: const [
              'Niki',
              'Rahmadi',
              'Wiharto',
            ],
            selected: selected,
            valueLabel: (v) => v,
            label: 'Select',
            onSelected: (val) {
              setState(() {
                selected = val;
              });
            },
            child: NxBox(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NxText('Single Select: **${selected ?? ''}**'),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}