import 'package:authlearning/firebasemethod/firebaseauth.dart';
import 'package:authlearning/pages/homepage.dart';
import 'package:authlearning/utils/properties.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => _EmailLoginState();
}

void loginUser(BuildContext context) async {
  await FirebaseAuthMethod(FirebaseAuth.instance).loginWithEmail(
      email: _getLoginEmail.text,
      password: _getLoginPass.text,
      context: context);
}

TextEditingController _getLoginEmail = TextEditingController();
TextEditingController _getLoginPass = TextEditingController();

class _EmailLoginState extends State<LoginEmail> {
  // @override
  // void dispose() {
  //   super.dispose();
  //   _getLoginEmail.dispose();
  //   _getLoginPass.dispose();
  // }

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
                  textField(context, "Enter Your Mail*", _getLoginEmail),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(context, "Enter Your Password*", _getLoginPass),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        loginUser(context);
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                        // dispose();
                      },
                      child: const Text("Login"))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
