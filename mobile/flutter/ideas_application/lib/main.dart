import 'dart:convert';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideas_application/components/drawer.dart';
import 'package:ideas_application/pages/profile_page.dart';
import 'firebase_options.dart';

import 'pages/login_page.dart';
import 'main.dart';
import 'headers/header.dart';
import 'headers/create_message.dart';
import 'messages/message_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if the user is logged in
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
    {"mId": 1, "mMessage": "First message", "mLikes": 0},
    {"mId": 2, "mMessage": "Second message", "mLikes": 10},
  ];

  // Helper function to print the database (messages list) as JSON
  void printDatabase() {
    String jsonString = jsonEncode(messages); // Convert to JSON string
    print('Database JSON: $jsonString'); // Print the JSON string
  }

  // Function to add a new message with 0 initial likes
  void addNewMessage(String message) {
    setState(() {
      messages.insert(0, {
        "mId": messages.length + 1, // Incremental ID
        "mMessage": message,
        "mLikes": 0, // Initial likes
      });
    });

    print('New message added: $message');
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

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    //pop menu drawber
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
      ), // add drawer here
      body: Column(
        children: [
          CreateMessage(onCreateMessage: addNewMessage), // Create new mesage
          Expanded(
            child: MessageList(
              messages: messages,
              onUpdateLikes: updateLikes, // update likes for message
            ),
          ),
        ],
      ),
    );
  }
}
