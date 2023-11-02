import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 229, 130),
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
                      Navigator.of(context).pushNamed("EmailLogin");
                    },
                    child: const Text("Email Sign Up")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("PhoneLogin");
                    },
                    child: const Text("Phone Number Sign Up")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("LoginThroughEmail");
                    },
                    child: const Text("Email Login")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("LoginThroughGoogle");
                    },
                    child: const Text("Google Login")),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
        ),
      ),
    ));
  }
}
