import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/text_box.dart';
import 'package:ideas_application/pages/gallery_page.dart';
import 'package:ideas_application/pages/home_page.dart';
import 'package:ideas_application/pages/camera_page.dart';

class ImagePage extends StatefulWidget{
  const ImagePage({super.key});

  @override 
  State<ImagePage> createState() => _ImagePage();
}
class _ImagePage extends State<ImagePage>
{

  void goToCameraPage() {
    //pop menu drawer
    Navigator.pop(context);

    //go to a new page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Choose your image preferance"),
        backgroundColor: const Color.fromARGB(255, 33, 150, 243),
      ),
      body: ListView(
        children: [
          const SizedBox(height : 100),
          IconButton(
            iconSize: 100,
            icon: const Icon(Icons.camera_alt_rounded),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const CameraPage()));
            }
          ),
          const SizedBox(height: 100),

          //add a link button
          IconButton(
            iconSize: 100,
            icon: const Icon(Icons.image),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const GalleryPage()));
            }
            ),
        ],
      ),
    );
  }

}
