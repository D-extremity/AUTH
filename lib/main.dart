import 'package:authlearning/firebase_options.dart';
import 'package:authlearning/pages/email.dart';
import 'package:authlearning/pages/googlelogin.dart';
import 'package:authlearning/pages/homepage.dart';
import 'package:authlearning/pages/loginemail.dart';
import 'package:authlearning/pages/mainpage.dart';
import 'package:authlearning/pages/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      routes: {
        "PhoneLogin": (context) => const PhoneLogin(),
        "EmailLogin": (context) => const EmailLogin(),
        "LoginThroughEmail": (context) => const LoginEmail(),
        "LoginThroughGoogle": (context) => const GoogleLogin(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            } else {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return MainPage();
              }
            }
          })),
    );
  }
}
