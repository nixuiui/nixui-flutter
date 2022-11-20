import 'package:example/screens/form_field_basic.dart';
import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_text.dart';

class FormFieldScreen extends StatefulWidget {
  const FormFieldScreen({ Key? key }) : super(key: key);

  @override
  State<FormFieldScreen> createState() => _FormFieldScreenState();
}

class _FormFieldScreenState extends State<FormFieldScreen> {


  @override
  Widget build(BuildContext context) {
      
      var menu = const [
        { 'title': 'Form Field Basic',  'screen': FormFieldBasicScreen()},
      ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Field"),
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