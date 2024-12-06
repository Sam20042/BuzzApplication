// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:camera/camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/main.dart';
import 'package:ideas_application/messages/message_list.dart';

void main() {
  testWidgets('Verify if camera icon exists', (WidgetTester tester) async {
    String comment = 'hello chap';
    int id = 0;
    int change = 0;
    void updateComment(int id, String comment2){
      comment = comment2;
    }
    final List<Map<String, dynamic>> a = [ {
        "mId": 0, // Incremental ID
        "mMessage": 'test message',
        "mLikes": 0, // Initial likes
        "mDislikes": 0, // Initial dislikes
        "mComment": comment, // Empty comment initially
        "mImage": null, //empty image initially
    }];
    await tester.pumpWidget(
      MaterialApp(
        home: MessageList(messages: a, 
        onUpdateLikes: (id , change ) {},
        onUpdateDislikes: (id ,  change) {}, 
        onUpdateComment: updateComment,
        onUpdateCommentImage: (id , Null) {  }, 
        ),
      ),
    );


    // Check if Camera Icon is present
    var check = find.byIcon(Icons.image); //determines if the image upload button exists
    expect(check, findsOneWidget);
    var check2 = find.byType(TextButton); //determines if the link upload button exists
    expect(check2, findsOneWidget);
    var commentLocation = find.byType(TextField);
    expect(commentLocation, findsOneWidget);

    //expect(t, "hello new chap");
  });
}