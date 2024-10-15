import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final Function(int, int) onUpdateLikes; // Takes ID and increment (+1/-1)

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
          contentPadding: const EdgeInsets.all(8.0),
          title: Text(
            message['mMessage'] ?? 'No message', // Handle null message safely
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Like Button
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => onUpdateLikes(message['mId'], 1), // Increment by 1
              ),

              const SizedBox(width: 4),

              // Dislike Button
              IconButton(
                icon: const Icon(Icons.thumb_down),
                onPressed: () => onUpdateLikes(message['mId'], -1), // Decrement by 1
              ),

              const SizedBox(width: 8),

              // Like Counter
              Text(
                '${message['mLikes'] ?? 0}', // Display like count
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
