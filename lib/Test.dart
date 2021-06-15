import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final db = await firestore.collection('test').get();
    for (var i in db.docs) {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${i.data()['name']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.green,
            height: 500,
            width: 500,
            child: Text('dhfjdf')),
      ),
    );
  }
}
