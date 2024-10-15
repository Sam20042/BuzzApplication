import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final Function(int, int) onUpdateLikes;

  const MessageList({
    super.key,
    required this.messages,
    required this.onUpdateLikes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          title: Text(
            message['message'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  onUpdateLikes(
                    message['id'],
                    message['likes'] + 1,
                  );
                },
              ),
              const SizedBox(width: 4),
              Text('${message['likes']}'),
            ],
          ),
        );
      },
    );
  }
}
