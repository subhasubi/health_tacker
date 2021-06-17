import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String email = 'subha@gmail.com';
  String password = '1234567890';
  Future loginFunction(email, password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(
        '$result jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
  }

  Future signFunction(email, password) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print('$user kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
  }

  addData() {
    firestore
        .collection('user')
        .add({'name': 'subha', 'email': 'subha@gmai.com'});
  }

  getData() async {
    final doc = await firestore.collection('user').get();

    for (var i in doc.docs) {
      print('hhhhhhhhhhhhhhhhhhhhh ${doc.docs}');
      print('kkkkkkkkkkkkkkkkkkkkk $i');
      print(i.data());
      print(i.data()['name']);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // signFunction(email, password);
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text('testing'),
            onPressed: () {
              getData();
            },
          ),
        ),
      ),
    );
  }
}
