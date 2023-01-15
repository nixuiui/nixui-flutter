import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class OptionSelectorScreen extends StatefulWidget {
  const OptionSelectorScreen({ Key? key }) : super(key: key);

  @override
  State<OptionSelectorScreen> createState() => _OptionSelectorScreenState();
}

class _OptionSelectorScreenState extends State<OptionSelectorScreen> {

  NxOptions? selected;
  List<NxOptions> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxOptionSelector Widget"),
      ),
      body: ListView(
        children: [
          NxOptionsSelector(
            multipleSelect: true,
            options: [
              NxOptions(name: 'Niki', value: 'niki'),
              NxOptions(name: 'Rahmadi', value: 'Rahmadi'),
              NxOptions(name: 'Wiharto', value: 'Wiharto'),
            ],
            selected: selectedList,
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
            options: [
              NxOptions(name: 'Niki', value: 'niki'),
              NxOptions(name: 'Rahmadi', value: 'Rahmadi'),
              NxOptions(name: 'Wiharto', value: 'Wiharto'),
            ],
            selected: selected,
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
                  NxText('Single Select: **${selected?.name ?? ''}**'),
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