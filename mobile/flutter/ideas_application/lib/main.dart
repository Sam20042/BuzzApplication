import 'package:flutter/material.dart';
import 'headers/header.dart';
import 'headers/create_message.dart';
import 'messages/message_list.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatefulWidget {
  const FigmaToCodeApp({super.key});

  @override
  State<FigmaToCodeApp> createState() => _FigmaToCodeAppState();
}

class _FigmaToCodeAppState extends State<FigmaToCodeApp> {
  // In-memory list to simulate a database
  List<Map<String, dynamic>> messages = [
    {'id': 1, 'message': 'Hello from in-memory database!', 'likes': 5},
    {'id': 2, 'message': 'This is another local message.', 'likes': 3},
  ];

void addNewMessage(String message) {
  setState(() {
    messages.insert(0, {
      'id': messages.length + 1,
      'message': message,
      'likes': 0,
    });
    print(messages); // Print the messages list after adding a new message
  });
}

void updateLikes(int id, int newLikes) {
  setState(() {
    final index = messages.indexWhere((msg) => msg['id'] == id);
    if (index != -1) {
      messages[index]['likes'] = newLikes;
      print(messages); // Print the messages list after updating likes
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Column(
          children: [
            const Header(),
            CreateMessage(onCreateMessage: addNewMessage),
            Expanded(
              child: MessageList(
                messages: messages,
                onUpdateLikes: updateLikes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
