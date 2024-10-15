import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  final String title;
  final int initialLikes;
  final Function(int) onLikeToggle;

  const MessageItem({
    super.key,
    required this.title,
    required this.initialLikes,
    required this.onLikeToggle,
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
    likeCount = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });

    widget.onLikeToggle(likeCount);
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
              color: isLiked ? Colors.green : Colors.black,
            ),
            onPressed: toggleLike,
          ),
          Text('$likeCount'),
        ],
      ),
    );
  }
}
