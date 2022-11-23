import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({ Key? key }) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxCard Widget"),
      ),
      body: ListView(
        children: [
          NxCard(
            padding: const EdgeInsets.all(20),
            title: NxText("Title"),
            actions: const [
              Icon(Icons.more_vert),
            ],
            child: NxBox(
              height: 200,
              borderRadius: 8,
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}