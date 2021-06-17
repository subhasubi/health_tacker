import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_tacker/Pages/HomePage.dart';
import 'package:health_tacker/Pages/LoginPage.dart';
import 'package:health_tacker/Pages/RegisterPage.dart';
import 'package:health_tacker/Pages/WelcomePage.dart';
import 'package:health_tacker/Test.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
