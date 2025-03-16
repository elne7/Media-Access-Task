import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<XFile> imagesList = []; // List to store the selected images
  final ImagePicker picker = ImagePicker(); // ImagePicker instance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.file(File(imagesList[index].path)), // Display the selected images
                ),
              );
            },
          ),
        ),
      ),
      // Floating action button to open the image picker
      floatingActionButton: TextButton(
        onPressed: () async {
          final List<XFile> images = await picker.pickMultiImage();
          // Add the selected images to the list and update the UI
          setState(() {
            if (images.isNotEmpty) {
              imagesList.addAll(images);
            }
          });
        },
        child: Text('Add Image'),
      ),
    );
  }
}
