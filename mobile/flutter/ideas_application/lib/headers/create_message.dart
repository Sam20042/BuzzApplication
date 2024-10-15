import 'package:flutter/material.dart';

class CreateMessage extends StatelessWidget {
  final Function(String) onCreateMessage;

  const CreateMessage({super.key, required this.onCreateMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    return Column(
      children: [
        // Input Field for Message Title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter message title',
            ),
          ),
        ),
        // Create Message Button
        ElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty) {
              onCreateMessage(titleController.text);
              titleController.clear(); // Clear input after message creation
            }
          },
          child: const Text('Create Message'),
        ),
      ],
    );
  }
}
