import 'dart:convert'; 
import 'package:flutter/material.dart'; 
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:ideas_application/components/drawer.dart'; 
import 'package:ideas_application/pages/profile_page.dart'; 
import 'firebase_options.dart'; 
import 'pages/login_page.dart'; 
import 'headers/header.dart'; 
import 'headers/create_message.dart'; 
import 'messages/message_list.dart'; 
import 'components/comment.dart'; // Import the Comment widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const FigmaToCodeApp();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

class FigmaToCodeApp extends StatefulWidget {
  const FigmaToCodeApp({super.key});

  @override
  State<FigmaToCodeApp> createState() => _FigmaToCodeAppState();
}

class _FigmaToCodeAppState extends State<FigmaToCodeApp> {
  List<Map<String, dynamic>> messages = [
    {
      "mId": 1,
      "mMessage": "First message",
      "mUpvotes": 0,
      "comments": [
        {"user": "User1", "text": "Nice message!", "time": "10:30 AM"}
      ]
    },
    {
      "mId": 2,
      "mMessage": "Second message",
      "mUpvotes": 10,
      "comments": [
        {"user": "User2", "text": "Interesting!", "time": "11:00 AM"}
      ]
    },
  ];

  void printDatabase() {
    String jsonString = jsonEncode(messages);
    print('Database JSON: $jsonString');
  }

  void addNewMessage(String message) {
    setState(() {
      messages.insert(0, {
        "mId": messages.length + 1,
        "mMessage": message,
        "mUpvotes": 0,
        "comments": [],
      });
    });

    print('New message added: $message');
    printDatabase();
  }

  void updateUpvotes(int id, int increment) {
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == id);
      message['mUpvotes'] += increment;
    });

    print('Upvotes updated for message ID $id');
    printDatabase();
  }

  void addComment(int messageId, String text) {
    setState(() {
      final message = messages.firstWhere((msg) => msg['mId'] == messageId);
      message['comments'].add({
        "user": "CurrentUser",
        "text": text,
        "time": DateTime.now().toString(),
      });
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
      body: Column(
        children: [
          CreateMessage(onCreateMessage: addNewMessage),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(message['mMessage']),
                        subtitle: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () => updateUpvotes(message['mId'], 1),
                            ),
                            Text('${message['mUpvotes']} upvotes'),
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController commentController = TextEditingController();
                                    return AlertDialog(
                                      title: Text('Add a Comment'),
                                      content: TextField(
                                        controller: commentController,
                                        decoration: InputDecoration(hintText: "Write your comment here..."),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            addComment(message['mId'], commentController.text);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Post'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      // Show the comments for each message
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 8),
                        child: Column(
                          children: message['comments']
                              .map<Widget>((comment) => Comment(
                                    text: comment['text'],
                                    user: comment['user'],
                                    time: comment['time'],
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
