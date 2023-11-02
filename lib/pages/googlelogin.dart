import 'package:authlearning/firebasemethod/firebaseauth.dart';
// import 'package:authlearning/utils/properties.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

// TextEditingController _getNumber = TextEditingController();
// TextEditingController _getOtp = TextEditingController();

Future<void> googleSignIn(BuildContext context) async {
  await FirebaseAuthMethod(FirebaseAuth.instance)
      .signInWithGoogle(context);
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 213, 156),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                ),
                TextButton(
                    onPressed: () {
                   googleSignIn(context);
                    },
                    child: const Text("Sign In")),
              ]
            );
          }),
        ),
      ),
    ));
  }
}