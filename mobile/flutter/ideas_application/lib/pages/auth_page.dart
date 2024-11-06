import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/main.dart';
import 'package:ideas_application/pages/login_page.dart'; // Ensure main app is imported

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const FigmaToCodeApp(); // Show main app page if logged in
          }
          // User is not logged in
          else {
            return LoginPage(); // Show login page if not logged in
          }
        },
      ),
    );
  }
}
