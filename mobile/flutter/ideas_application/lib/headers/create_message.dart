import 'package:flutter/material.dart';

class CreateMessage extends StatelessWidget {
  final Function(String) onCreateMessage;

  const CreateMessage({super.key, required this.onCreateMessage});

  // Show the modal to create a new message
  void showCreateMessageModal(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a New Idea'),
          content: TextField(
            controller: messageController,
            decoration: const InputDecoration(
              hintText: 'What\'s your thoughts?',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel Idea'),
            ),
            ElevatedButton(
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  onCreateMessage(messageController.text);
                  Navigator.of(context).pop(); // Close after submission
                }
              },
              child: const Text('Submit Idea'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showCreateMessageModal(context),
      child: const Text('Create Idea'),
    );
  }
}
