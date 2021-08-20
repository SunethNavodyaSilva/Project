import 'package:Project/User/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


Future<void> setUp(String email, String name, String instrument) async{
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    "Email": email,
    "User Name": name,
    "Instrument": instrument,
  });
  return;
}

