import 'package:flutter/material.dart';

class CreateMessage extends StatelessWidget {
  final Function(String) onCreateMessage;

  const CreateMessage({super.key, required this.onCreateMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: messageController,
            decoration: const InputDecoration(
              hintText: 'Enter message',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (messageController.text.isNotEmpty) {
              onCreateMessage(messageController.text);
              messageController.clear(); // Clear input field
            }
          },
          child: const Text('Create Message'),
        ),
      ],
    );
  }
}
