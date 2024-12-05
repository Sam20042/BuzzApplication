import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/text_box.dart';
import 'package:ideas_application/pages/home_page.dart';

class CameraPage extends StatefulWidget{
  const CameraPage({super.key});

  @override 
  State<CameraPage> createState() => _ImagePage();
}
class _ImagePage extends State<CameraPage>
{
  CameraController? camController;
  List<CameraDescription> cameras = [];

  @override
  void initState(){
    super.initState();
    cameraSetUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builder(),
      );
  }

  Widget builder(){
    if(camController?.value.isInitialized == false || camController == null){
        return const Center(child: CircularProgressIndicator(),
        );
    }
    return SafeArea(child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: CameraPreview(camController!)
            ),
            IconButton(onPressed: () async {
              XFile picture = await camController!.takePicture();
              Gal.putImage(picture.path,);
              Navigator.pop(context);
            }, 
              iconSize: 50,
              icon: const Icon(
              Icons.camera,
              color: Colors.grey,
            ),
            )
        ]),
    ));
  }

  Future<void> cameraSetUp() async{
    List<CameraDescription> cameraTest = await availableCameras();
    if(cameraTest.isNotEmpty){
      setState((){
        cameras = cameraTest;
        camController = CameraController(cameraTest[0], ResolutionPreset.medium);
      });
      camController?.initialize().then((_){
        setState((){

        });
      });
    }
  }
}
