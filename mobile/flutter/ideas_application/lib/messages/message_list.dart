import 'package:flutter/material.dart';
import 'package:ideas_application/pages/gallery_page.dart';
import 'package:ideas_application/pages/link_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ideas_application/pages/camera_page.dart';
import 'dart:io';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final Function(int, int) onUpdateLikes; // Takes ID and increment (+1/-1)
  final Function(int, int) onUpdateDislikes; // Takes ID and increment (+1/-1)
  final Function(int, String) onUpdateComment; // Takes ID and new comment
  final Function (int, File?) onUpdateCommentImage;

  const MessageList({
    super.key,
    required this.messages,
    required this.onUpdateLikes,
    required this.onUpdateDislikes,
    required this.onUpdateComment,
    required this.onUpdateCommentImage,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        String updateMessage = '';
        String updateMessageImage = '';
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
                if(message['mImage'] != null)
                  Image.file(message['mImage'],
                  width: 50,
                  height: 50)
                  else
                    const Text('No Image'),
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
                    const SizedBox(width: 2),

                    // Dislike Button
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      onPressed: () => onUpdateDislikes(message['mId'], 1), // Increment by 1
                    ),
                    const SizedBox(width: 2),

                    // Like Counter
                    Text(
                      '${message['mLikes'] ?? 0}', // Display like count
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Dislike Counter
                    Text(
                      '${message['mDislikes'] ?? 0}', // Display dislike count
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),

                    //add a photo button
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () async{
                        final newMessage = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryPage(Messageid: message['mId'], onUpdateComment: (id,updateMessage){
                              onUpdateComment(id,updateMessage);
                            })
                          )
                        );
                        if(newMessage != null){
                          updateMessageImage = newMessage;
                          File fileToUpload = File(updateMessageImage);
                          onUpdateCommentImage(message['mId'], fileToUpload);
                        }else{
                          print("no file found");
                        }
                      }
                    ),
                    const SizedBox(width: 1),
                    IconButton(
                      icon: const Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const CameraPage()));
                      }
                  ),

                    //add a link button
                    IconButton(
                      icon: const Icon(Icons.link),
                      onPressed: () async {
                        final newMessage = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LinkPage(Messageid: message['mId'], onUpdateComment: (id,url){
                              onUpdateComment(id,url);
                            })
                          )
                        );
                        if(newMessage != null){
                          updateMessage = newMessage;
                          onUpdateComment(message['mId'], updateMessage);
                        }
                      }
                    ),
                    TextButton(onPressed: () async{
                      if(message['mComment'] != null){
                        var newUrl = Uri.https(message['mComment']);
                        if(await canLaunchUrl(newUrl)){
                          await launchUrl(newUrl);
                        }
                      }
                    }, child: const Text("open link")),
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

