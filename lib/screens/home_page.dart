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
  String? _maskImagePath;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
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
                    const SizedBox(height: 30),
                    const Text(
                      'Upload Your Image',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(118, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () async => await _chooseFile(),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _maskImagePath != null
                ? SizedBox(
                    height: 400,
                    child: WidgetMask(
                      blendMode: BlendMode.dstIn,
                      childSaveLayer: true,
                      mask: Image.asset(_maskImagePath!),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!)
                          : Container(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future _chooseFile() {
    return showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setInnerState) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    await _pickImageFromCamera();
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    final _returnedImage = await _pickImageFromGallery();
                    setInnerState(() {
                      _selectedImage = File(_returnedImage!.path);
                    });
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                ),
                _selectedImage != null
                    ? Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _maskImagePath =
                                        'assets/images/user_image_frame_1.png';
                                  });
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/user_image_frame_1.png',
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _maskImagePath =
                                        'assets/images/user_image_frame_2.png';
                                  });
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/user_image_frame_2.png',
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _maskImagePath =
                                        'assets/images/user_image_frame_3.png';
                                  });
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/user_image_frame_3.png',
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _maskImagePath =
                                        'assets/images/user_image_frame_4.png';
                                  });
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/user_image_frame_4.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _maskImagePath != null
                              ? ElevatedButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: const Text('Save'),
                                )
                              : Container(),
                        ],
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
    return returnedImage;
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
