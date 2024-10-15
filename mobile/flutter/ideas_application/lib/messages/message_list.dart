import 'package:flutter/material.dart';
import 'message_item.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageItem(
          title: message['title'],
          initialLikes: message['thumbsUp'],
        );
      },
    );
  }
}
