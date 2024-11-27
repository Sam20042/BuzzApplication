import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/text_box.dart';
import 'package:ideas_application/messages/message_list.dart';
import 'package:ideas_application/pages/gallery_page.dart';
import 'package:ideas_application/messages/message_list.dart';
import 'package:ideas_application/pages/home_page.dart';
import 'package:ideas_application/pages/image_page.dart';
import 'package:ideas_application/pages/profile_page.dart';
import 'package:ideas_application/main.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkPage extends StatefulWidget{
  const LinkPage({super.key});

  @override 
  State<LinkPage> createState() => _LinkPage();
}
class _LinkPage extends State<LinkPage>
{
  String url = '';
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Please add the link to upload"),
        backgroundColor: const Color.fromARGB(255, 33, 150, 243),
      ),
      body: ListView(
        children: [
          TextField(
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(
              label: Text('URL'),
            ),
            onChanged: (value) {
              setState(() {
                url = value;
                //const FigmaToCodeApp.updateComment();
              });
            }
          ),
          const SizedBox(width: 100),
          IconButton(
            icon: const Icon(Icons.skip_next_outlined),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const MyApp()));
            }
          ),
        ],
      ),
    );
  }

}
