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
    likeCount = widget.initialLikes; // Initialize with initial like count
  }

  
  // Toggle like and update counter
  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked; // Toggle state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.thumb_up_alt_outlined,
              color: isLiked ? Colors.green : Colors.black,
            ),
            onPressed: toggleLike,
          ),
          const SizedBox(width: 4),
          Text(
            '$likeCount',
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
