import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/text_box.dart';
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
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const CameraPage()));
            }
          ),
          const SizedBox(width: 4),

          //add a link button
          IconButton(
            icon: const Icon(Icons.browse_gallery),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const CameraPage()));
            }
            ),
        ],
      ),
    );
  }

}
