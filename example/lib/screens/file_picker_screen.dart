import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({ Key? key }) : super(key: key);

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxFilePicker Widget"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 4/3,
            child: NxFilePicker(
              onSelected: (file) => setState(() => this.file = file),
              child: NxBox(
                color: Colors.grey[100],
                borderRadius: 8,
                child: file != null 
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('File Name: ${file?.path.split('/').last}'),
                              Text('Size: ${file?.lengthSync()}'),
                              Text('Path: ${file?.path}'),
                            ],
                          ),
                        )
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_present,
                              size: 80,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: 16),
                            NxText.headline6(
                              'Pick File',
                              color: Colors.grey,
                            ),
                          ],
                        )
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}