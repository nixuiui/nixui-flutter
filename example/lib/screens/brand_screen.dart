import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_box.dart';
import 'package:nixui/widgets/nx_text.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Brand Widget"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.red,
            child: NxBox(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NxText("Padding: 16"),
                  NxText("Margin: 16"),
                ],
              ),
            ),
          ),
          NxBox(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            borderRadius: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                NxText("padding: 16"),
                NxText("margin: 16"),
                NxText("borderRadius: 8"),
              ],
            ),
          )
        ],
      ),
    );
  }
}