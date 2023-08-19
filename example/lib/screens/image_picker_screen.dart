import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({ Key? key }) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  File? image1;
  File? image2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxImagePicker Widget"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 4/3,
            child: NxImagePicker.gallery(
              onSelected: (file) => setState(() => image1 = file),
              showCamera: true,
              child: NxBox(
                color: Colors.grey[100],
                borderRadius: 8,
                child: image1 != null 
                    ? NxImage(
                      radius: 8,
                      size: double.infinity,
                      image: FileImage(image1!),
                    )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_rounded,
                              size: 80,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: 16),
                            NxText.headline6(
                              'Pick Photo From Gallery',
                              color: Colors.grey,
                            ),
                          ],
                        )
                      ),
              ),
            ),
          ),
          SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 3/3,
            child: NxBox(
              borderRadius: 8,
              color: Colors.grey[100],
              child: NxPermissionHandlerWrapper(
                description: 'Izinkan aplikasi mengakses Foto untuk menambahkan gambar',
                permissions: [
                  Permission.camera,
                  if(Platform.isIOS) Permission.storage,
                  if(Platform.isAndroid) ...[
                    Permission.photos,
                    Permission.videos,
                  ]
                ],
                child: NxImagePicker.camera(
                  onSelected: (file) => setState(() => image2 = file),
                  child: image2 != null 
                      ? NxImage(
                        radius: 8,
                        size: double.infinity,
                        image: FileImage(image2!),
                      )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 80,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 16),
                              NxText.headline6(
                                'Pick Photo From Camera',
                                color: Colors.grey,
                              ),
                            ],
                          )
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}