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
  List<Map<String, dynamic>> messages = [
    {"title": "First Post", "thumbsUp": 5},
    {"title": "Second Post", "thumbsUp": 3},
  ];

  void addNewMessage(String title) {
    setState(() {
      messages.insert(0, {
        "title": title,
        "thumbsUp": 0,
      });
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
              child: MessageList(messages: messages),
            ),
          ],
        ),
      ),
    );
  }
}
