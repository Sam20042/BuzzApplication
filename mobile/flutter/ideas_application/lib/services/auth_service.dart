import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  //google sign-in

  signInWithGoogle() async{
    //begin interactive sign in process
final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth details form request

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth

    );
    //finally, lets sign in
  }
}