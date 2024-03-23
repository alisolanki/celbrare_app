import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget_mask/widget_mask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Image/Icon',
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 400.00,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(50.0), // Set border radius(),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 181, 172, 190),
                      Color.fromARGB(255, 221, 191, 240),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    const Text('Upload Your Image',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(118, 0, 0, 0),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: _pickImageFromGallary,
                          child: const Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  'Choose File',
                                ),
                                Icon(Icons.upload_file),
                              ],
                            ),
                          )),
                    ),
                    WidgetMask(
                      blendMode: BlendMode.srcIn,
                      childSaveLayer: true,
                      mask: Image.asset('assets/images/user_image_frame_2.png'),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!)
                          : Container(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ])),
    );
  }

  Future _pickImageFromGallary() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
              ),
              ListTile(
                onTap: _pickImageFromGallaryy,
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
              )
            ])));
  }

  Future _pickImageFromGallaryy() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
