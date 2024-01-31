import 'package:authlearning/firebasemethod/firestoremethods.dart';
import 'package:authlearning/utils/userwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Available Users"),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: getUsers(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("No Network");
                } else {
                  if (snapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.size,
                            itemBuilder: ((context, index) {
                              return snapshot.data!.docs
                                  .map((document) => getUserWidget(document))
                                  .toList()[index];
                            })));
                  } else {
                    return Text("No User is present");
                  }
                }
              })
        ],
      ),
    ));
  }
}
