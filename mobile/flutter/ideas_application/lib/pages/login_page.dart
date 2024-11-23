// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideas_application/components/my_textfield.dart';
import 'package:ideas_application/components/my_button.dart';
import 'package:ideas_application/components/square_tile.dart';
import 'package:ideas_application/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async{
//show loading circle
showDialog(context: context, builder: (context){
return const Center(child: CircularProgressIndicator(),
);

});
//sign in w email and pass
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text, 
  password: passwordController.text,
  );

//try sign in
try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text, 
  password: passwordController.text,
  );
//pop circle
Navigator.pop(context);

} on FirebaseAuthException catch (e){
  //pop da circle
  Navigator.pop(context);

  //not lehigh email
  if (e.code == 'user-not-found'){
    
    //show error to user 
wrongEmailMessage();

  } else if (e.code == 'wrong-password'){
    //show error to user
    wrongPasswordMessage();
  }
}

  }

//wrong email msg popup

void wrongEmailMessage(){
  showDialog(context: context, 
  builder: (context) {
    return const AlertDialog(title: Text('Lehigh emails only!'),
    );
  },
  );
}

//wrong pass msg popup 
void wrongPasswordMessage(){
  showDialog(context: context, 
  builder: (context) {
    return const AlertDialog(title: Text('Wrong password :( '),
    );
  },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
            
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
            
                // welcome back
                Text(
                  'TheBuzz',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 42, 127, 197),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
            
                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 10),
            
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),
            
                const SizedBox(height: 50),
            
                // or continue with ...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 50),
            
                // google sign in button
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     SquareTile(imagePath: 'lib/images/googlelogo.png'),
                //     SizedBox(width: 25),
                //   ],
                // ),
            
                ElevatedButton(
                  onPressed: () => AuthService().signInWithGoogle(), 
                  child: const Text("Google Sign In"),
                ),
            
                const SizedBox(height: 50),
            
                // Don't have an account? Create one here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    Text(
                      "Create one here",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
