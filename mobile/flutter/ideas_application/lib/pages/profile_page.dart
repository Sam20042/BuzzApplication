import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//user
  final currentUser = FirebaseAuth.instance.currentUser!;

//edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Edit $field",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            //cancel button
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            //save button
            TextButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(newValue),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: Color.fromARGB(255, 33, 150, 243),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          //profile pic
          const Icon(
            Icons.person,
            size: 72,
          ),

          const SizedBox(height: 10),

          //display user email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(height: 50),

          //user details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'My Details',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          //username
          MyTextBox(
            text: 'ala326',
            //changeable
            sectionName: 'Username',
            onPressed: () => editField('Username'),
          ),

          //note
          MyTextBox(
            text: 'Empty note', //changeable
            sectionName: 'Note',
            onPressed: () => editField('Note'),
          ),

          //gender identity
          MyTextBox(
            text: 'Gender identity',
            //changeable
            sectionName: 'Gender identity',
            onPressed: () => editField('Gender identity'),
          ),

          //sexual orientation
          MyTextBox(
            text: 'Sexual orientation',
            //changeable
            sectionName: 'Sexual orientation',
            onPressed: () => editField('Sexual orientation'),
          ),

          //email
          MyTextBox(
            text: 'ala326@lehigh.edu',
            //changeable
            sectionName: 'Lehigh email',
            onPressed: () => editField('Lehigh email'),
          ),

          //user details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'My Ideas',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
