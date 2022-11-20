import 'package:example/screens/box_screen.dart';
import 'package:example/screens/button.dart';
import 'package:example/screens/card_screen.dart';
import 'package:example/screens/date_time_selector.dart';
import 'package:example/screens/selectable_list.dart';
import 'package:example/screens/text.dart';
import 'package:example/screens/form_field.dart';
import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
      
      var menu = const [
        { 'title': 'Box',  'screen': BoxScreen()},
        { 'title': 'Button',  'screen': ButtonScreen()},
        { 'title': 'Card',  'screen': CardScreen()},
        { 'title': 'Date Time Selector',  'screen': DateTimeSelectorScreen()},
        { 'title': 'Form Field',  'screen': FormFieldScreen()},
        { 'title': 'Selectable List',  'screen': SelectableListScreen()},
        { 'title': 'Text',  'screen': TextScreen()},
      ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Starter Pack"),
      ),
      body: ListView.separated(
        itemCount: menu.length,
        separatorBuilder: (_, __) => Divider(), 
        itemBuilder: (_, index) => ListTile(
            title: NxText(menu[index]['title'] as String),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => (menu[index]['screen'] as Widget)
            )),
          ), 
      ),
    );
  }
}