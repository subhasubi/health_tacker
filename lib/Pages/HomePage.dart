import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  HomePage({this.userEmail = ''});

  String? userEmail;
  Object test = {};

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username'),
            Text('${widget.userEmail}'),
            Text('Password'),
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection("User").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Lodsjhsdafhku");
                } else {
                  final message = snapshot.data;
                  final lis = [];
                  for (var j in message!.docs) {
                    print(j.data());
                    lis.add(j.data());
                  }
                  for (var x = 0; x < lis.length; x++) {
                    print(lis[x]['username']);
                    print(lis[x]);
                    print('ooooooooooooooooooooooooooooooooooooooooooooooooo');
                  }

                  return Text('${lis[0]['username']}');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
