import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  final String title;
  final int initialLikes;

  const MessageItem({
    super.key,
    required this.title,
    required this.initialLikes,
  });

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  late int likeCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikes; // Initialize with the provided likes
  }

  // Toggle the like state and update the like counter
  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--; // Decrement the like count
      } else {
        likeCount++; // Increment the like count
      }
      isLiked = !isLiked; // Toggle the like state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.thumb_up_alt_outlined,
              color: isLiked ? Colors.green : Colors.black, // Dynamic color
            ),
            onPressed: toggleLike, // Toggle the like state
          ),
          const SizedBox(width: 4), // Spacer between icon and number
          Text(
            '$likeCount', // Display the dynamic like count
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
