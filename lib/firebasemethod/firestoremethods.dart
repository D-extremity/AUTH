import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getUsers()  {
 return FirebaseFirestore.instance.collection("users").snapshots();
}
