import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';
import 'package:nixui/themes/theme.dart';

class SelectableListScreen extends StatefulWidget {
  const SelectableListScreen({ Key? key }) : super(key: key);

  @override
  State<SelectableListScreen> createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {

  var selectedIndex = 5;
  var paragraphs = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English',
    'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy',
    'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selectable List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[100],
                  child: NxSelectableList(
                    itemCount: paragraphs.length,
                    selected: selectedIndex,
                    padding: EdgeInsets.all(16),
                    direction: Axis.horizontal,
                    space: 16,
                    itemBuilder: (_, i) {
                      final selected = selectedIndex == i;
                      return NxBox(
                        color: selected ? NxColor.primary : NxColor.primary.light,
                        width: 40,
                        height: 40,
                        borderRadius: 4,
                        onPressed: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: Center(
                          child: NxText(
                            '${i+1}',
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  ),
                ),
                Divider(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: NxText.bodyLight(
                      paragraphs[selectedIndex],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[100],
                  child: NxSelectableList(
                    itemCount: paragraphs.length,
                    direction: Axis.vertical,
                    selected: selectedIndex,
                    padding: EdgeInsets.all(16),
                    space: 16,
                    itemBuilder: (_, i) {
                      final selected = selectedIndex == i;
                      return NxBox(
                        color: selected ? NxColor.primary : NxColor.primary.light,
                        width: 40,
                        height: 40,
                        borderRadius: 4,
                        onPressed: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: Center(
                          child: NxText(
                            '${i+1}',
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  ),
                ),
                Divider(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: NxText.bodyLight(
                      paragraphs[selectedIndex],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}