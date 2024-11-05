import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Begin interactive sign-in process
    final GoogleSignInAccount? gUser = await _googleSignIn.signIn();

    // Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign in with the credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    // Sign out from FirebaseAuth
    await FirebaseAuth.instance.signOut();

    // Disconnect the Google account to allow the selection screen to appear next time
    await _googleSignIn.disconnect();
  }
}
