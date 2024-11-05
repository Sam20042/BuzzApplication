import 'package:flutter/material.dart';
import 'package:ideas_application/pages/auth_page.dart';
import 'pages/login_page.dart'; // Import login page here
import 'dart:convert'; // Import for JSON encoding/decoding
import 'headers/header.dart';
import 'headers/create_message.dart';
import 'messages/message_list.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(), // Start with the login page (CHANGED TO AUTH)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          CreateMessage(onCreateMessage: addNewMessage), // Create new message
          Expanded(
            child: MessageList(
              messages: messages,
              onUpdateLikes: updateLikes, // Update likes for message
            ),
          ),
        ],
      ),
    );
  }
}
