import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final Function(int, int) onUpdateLikes; // Takes ID and increment (+1/-1)
  final Function(int, int) onUpdateDislikes; // Takes ID and increment (+1/-1)
  final Function(int, String) onUpdateComment; // Takes ID and new comment

  const MessageList({
    super.key,
    required this.messages,
    required this.onUpdateLikes,
    required this.onUpdateDislikes,
    required this.onUpdateComment,
  });

  /*void goToProfilePage() {
    //pop menu drawer
    Navigator.pop(context);

    //go to a new page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(
              message['mMessage'] ?? 'No message', // Handle null message safely
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Comment Display
                Text(
                  'Comment: ${message['mComment'] ?? 'No comment'}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                TextField(
                  onSubmitted: (newComment) {
                    onUpdateComment(message['mId'], newComment);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Edit Comment',
                    hintText: 'Write a comment...',
                  ),
                ),
                Row(
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
                      onPressed: () => onUpdateDislikes(message['mId'], 1), // Increment by 1
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
                    const SizedBox(width: 16),

                    // Dislike Counter
                    Text(
                      '${message['mDislikes'] ?? 0}', // Display dislike count
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 100),

                    //add a photo button
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () => onUpdateDislikes(message['mId'], 1), // Increment by 1
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
