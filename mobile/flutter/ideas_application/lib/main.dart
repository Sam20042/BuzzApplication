import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideas_application/components/drawer.dart';
import 'package:ideas_application/pages/profile_page.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'headers/header.dart';
import 'headers/create_message.dart';
import 'messages/message_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  SharedPreferences? prefs;
  late CameraController controll;

  @override
  void initState(){
    super.initState();
    initPrefs();
  }

  void initPrefs() async{ //in order to get the method asyncronosly
    prefs = await SharedPreferences.getInstance();
    setData();  
  }

  void setData() {
    prefs?.setString('Movie', 'Ice');
    print("set prefs method called");
  }

  void getData(){
    String food =prefs?.getString('favoriteFood') ?? 'null';
  }  

  @override
  void dispose(){
    controll.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    /*if(!controll.value.isInitialized){
      return Container();
    }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const FigmaToCodeApp(); // Main app page if logged in
          } else {
            return LoginPage(); // Login page if not logged in
          }
        },
      ),
    );
  }
}



class FigmaToCodeApp extends StatefulWidget {
  const FigmaToCodeApp({super.key});

  @override
  State<FigmaToCodeApp> createState() => _FigmaToCodeAppState();
}

class _FigmaToCodeAppState extends State<FigmaToCodeApp> {
  // Mock JSON database: List of messages
  List<Map<String, dynamic>> messages = [
    {"mId": 1, "mMessage": "First message", "mLikes": 0, "mDislikes": 0, "mComment": "Great post!"},
    {"mId": 2, "mMessage": "Second message", "mLikes": 10, "mDislikes": 2, "mComment": "Nice work!"},
  ];

  // Function to print the database (messages list) as JSON
  void printDatabase() {
    String jsonString = jsonEncode(messages); // Convert to JSON string
    print('Database JSON: $jsonString'); // Print the JSON string
  }

  // Function to add a new message with 0 initial likes, dislikes, and a comment
  void addNewMessage(String message) {
    setState(() {
      messages.insert(0, {
        "mId": messages.length + 1, // Incremental ID
        "mMessage": message,
        "mLikes": 0, // Initial likes
        "mDislikes": 0, // Initial dislikes
        "mComment": null, // Empty comment initially
      });
    });

    print('New message added: $message');
    printDatabase(); // Print updated database
  }

  //Function to edit messages
  void editMessage(String message) {
    setState(() {
      messages.insert(0, {
        "mId": 1, // Incremental ID
        "mMessage": message,
        "mLikes": 0, // Initial likes
        "mDislikes": 0, // Initial dislikes
        "mComment": null, // Empty comment initially
      });
    });

    print('Edited message: $message');
    printDatabase(); // Print updated database
  }

  // Function to update the like counter
  void updateLikes(int id, int increment) {
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == id);
      message['mLikes'] += increment;
    });

    print('Likes updated for message ID $id');
    printDatabase(); // Print updated database
  }

  // Function to update the dislike counter
  void updateDislikes(int id, int increment) {
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == id);
      message['mDislikes'] += increment;
    });

    print('Dislikes updated for message ID $id');
    printDatabase(); // Print updated database
  }

  // Function to update the comment
  void updateComment(int id, String newComment) {
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == id);
      message['mComment'] = newComment;
    });

    print('Comment updated for message ID $id');
    printDatabase(); // Print updated database
  }

  void updateCommentImage(int id, File? image){
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == id);
      message['mComment'] = image?.path;
    });

    print('Comment updated for message ID $id with the file path');
    printDatabase(); // Print updated database
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    //pop menu drawer
    Navigator.pop(context);

    //go to a new page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
      body: Column(
        children: [
          CreateMessage(onCreateMessage: addNewMessage), // Create new message
          Expanded(
            child: MessageList(
              messages: messages,
              onUpdateLikes: updateLikes, // Update likes
              onUpdateDislikes: updateDislikes, // Update dislikes
              onUpdateComment: updateComment, // Update comment
              onUpdateCommentImage: updateCommentImage, //update comment with image
            ),
          ),
        ],
      ),
    );
  }
}
