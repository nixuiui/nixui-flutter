import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_pickers/image_pickers.dart';

class NxFilePicker extends StatelessWidget {

  final Function(File)? onSelected;
  final Widget child;
  final int sizeLimit;
  final String? dialogTitle;
  final String? initialDirectory;
  final FileType type;
  final List<String>? allowedExtensions;
  final bool allowCompression;
  final bool allowMultiple;
  final bool withData;
  final bool withReadStream;
  final bool lockParentWindow;

  const NxFilePicker({ 
    Key? key,
    this.onSelected,
    required this.child,
    this.sizeLimit = 2000000,
    this.dialogTitle,
    this.initialDirectory,
    this.type = FileType.any,
    this.allowedExtensions,
    this.allowCompression = true,
    this.allowMultiple = false,
    this.withData = false,
    this.withReadStream = false,
    this.lockParentWindow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _pickFile(GalleryMode.image, (file) async {
          onSelected!.call(file);
        });
      },
      child: child,
    );
  }

  Future _pickFile(GalleryMode galleryMode, Function(File) onPick) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      type: type,
      allowedExtensions: allowedExtensions,
      allowCompression: allowCompression,
      allowMultiple: allowMultiple,
      withData: withData,
      withReadStream: withReadStream,
      lockParentWindow: lockParentWindow,
    );
    if (pickedFile == null) {
      return;
    }
    var file = File(pickedFile.files.single.path!);
    onPick(file);
  }
}