import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({ Key? key }) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxImagePicker Widget"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              NxImage.avatar(
                imageUrl: 'https://www.thesun.co.uk/wp-content/uploads/2022/09/d0a45152-d44a-4e48-a02f-fee0a3acf4db.jpg',
                size: 40,
                initialText: 'AA',
              ),
            ],
          )
        ],),
    );
  }
}