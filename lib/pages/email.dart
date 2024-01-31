import 'package:authlearning/firebasemethod/firebaseauth.dart';
import 'package:authlearning/pages/homepage.dart';
import 'package:authlearning/utils/properties.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

void signUpUser(BuildContext context) async {
  await FirebaseAuthMethod(FirebaseAuth.instance).signUpWithEmail(
      email: _getEmail.text, password: _getPass.text, context: context);
}

TextEditingController _getEmail = TextEditingController();
TextEditingController _getPass = TextEditingController();

class _EmailLoginState extends State<EmailLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                  ),
                  textField(context, "Enter Your Mail*", _getEmail),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(context, "Enter Your Password*", _getPass),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        signUpUser(context);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                        // dispose();
                      },
                      child: const Text("SignUp"))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
