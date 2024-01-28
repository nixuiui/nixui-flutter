import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:image_pickers/image_pickers.dart';

enum NxImagePickerResource { gallery, camera }

class _NxImagePickerBasic extends StatelessWidget {

  final Function(File)? onSelected;
  final Widget child;
  final bool withCompression;
  final int sizeLimit;
  final bool showCamera;
  final NxImagePickerResource resource;
  final bool withPreview;

  const _NxImagePickerBasic({ 
    Key? key,
    this.onSelected,
    required this.child,
    this.withCompression = false,
    this.sizeLimit = 2000000,
    this.showCamera = false,
    this.resource = NxImagePickerResource.gallery,
    this.withPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(resource == NxImagePickerResource.gallery) {
          await _pickImage(GalleryMode.image, (file) => imagePicked(file, context));
        } else if(resource == NxImagePickerResource.camera) {
          await _takePicture((file) => imagePicked(file, context));
        }
      },
      child: child,
    );
  }
  
  Future<void> imagePicked(File file, BuildContext context) async {
    if(withCompression) {
      file = await compressImage(file, sizeLimit);
    }

    if(withPreview) {
      final result = await Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => _ImagePreviewScreen(file))
      );

      print('result: $result');

      if(result != null) {
        onSelected!.call(file);
      }
    } else {
      onSelected!.call(file);
    }
  }

  Future _pickImage(GalleryMode galleryMode, Function(File) onPick) async {
    final pickedFile = await ImagePickers.pickerPaths(
      galleryMode: galleryMode,
      selectCount: 1,
      compressSize: 100,
      showCamera: showCamera,
    );
    if (pickedFile.isEmpty) {
      return;
    }
    var image = File(pickedFile[0].path!);
    onPick(image);
  }

  Future _takePicture(Function(File) onPick) async {
    final pickedFile = await ImagePickers.openCamera(
      compressSize: 100
    );
    if (pickedFile == null) {
      return;
    }
    var image = File(pickedFile.path!);
    onPick(image);
  }

  Future<File> compressImage(File file, int limit) async {
    var minLimit = 1000000;
    if(limit < minLimit) limit = minLimit;
    var size = file.lengthSync();
    while (size >= limit) {
      var result = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        minWidth: 1024,
        minHeight: 1024,
        quality: 80,
      );
      var image = img.decodeJpg(result!)!;
      File(file.path).writeAsBytesSync(img.encodePng(image));
      size = file.lengthSync();
    }
    return file;
  }
}

class _ImagePreviewScreen extends StatelessWidget {

  final File file;
  
  const _ImagePreviewScreen(this.file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, {
              'result': 'ok'
            }), 
            icon: Icon(Icons.check)
          ),
        ],
      ),
      body: Image(image: FileImage(file)),
    );
  }
}

class NxImagePicker extends _NxImagePickerBasic {
  
  const NxImagePicker.gallery({
    super.key, 
    super.onSelected,
    super.withCompression,
    super.sizeLimit,
    super.showCamera,
    super.withPreview,
    required super.child,
  }) : super(
    resource: NxImagePickerResource.gallery
  );

  const NxImagePicker.camera({
    super.key, 
    super.onSelected,
    super.withCompression,
    super.sizeLimit,
    super.withPreview,
    required super.child,
  }) : super(
    resource: NxImagePickerResource.camera
  );

}