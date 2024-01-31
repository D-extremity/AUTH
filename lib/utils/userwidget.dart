import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget getUserWidget(DocumentSnapshot document) {
  Map<String, dynamic> user = (document.data() as Map<String, dynamic>);
  return Card(color: Colors.blue,
    child: Column(children: [
      Text("Name : ${user['name']}",style: TextStyle(fontSize: 30,color:Colors.black87),),
      Text("AGE : ${user['age']}")
    ],),
  );
}
