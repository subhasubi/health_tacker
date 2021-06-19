import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_tacker/Pages/RegisterPage.dart';
import 'package:health_tacker/widgets/Button.dart';
import 'package:health_tacker/widgets/LinkButton.dart';
import 'package:health_tacker/widgets/input_field.dart';
import 'package:health_tacker/widgets/logo.dart';
import 'package:health_tacker/widgets/title_and_subtitle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String email = 'subha@gmail.com';
  String password = '1234567890';
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future loginFunction(email, password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(result);
      print(
          '==========================================================================');
    } catch (error) {
      print(error);
      if (error == 'firebase_auth/user-not-found') {
        print('555555555555555555555555555555555555555');
      }
      print(
          'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFDBDBDB),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Logo(
                    url: 'images/login.jpg',
                    height: 200,
                    width: 300,
                    borderRadius: 10,
                  ),
                  SizedBox(height: 25),
                  TitleName(
                    title: 'Log In Now',
                    subTitle: 'Please Log In to continue using our App',
                  ),
                  SizedBox(height: 25),
                  InputField(
                    controller: _email,
                    isPassword: false,
                    hintText: 'Email',
                  ),
                  SizedBox(height: 25),
                  InputField(
                    controller: _password,
                    hintText: 'Password',
                    isIcon: true,
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LinkButton(
                        normalText: 'Forget Password?',
                        onPressed: () {
                          /// TODO:forget code?
                          print("hello");
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  CustomButton(
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 60,
                    width: double.infinity,
                    color: Colors.blueAccent,
                    onPressed: () {
                      print('${_email.text} , ${_password.text}');
                      loginFunction(_email.text, _password.text);
                    },
                  ),
                  SizedBox(height: 25),
                  LinkButton(
                    normalText: 'Don\'t have an Account? ',
                    mainText: 'Sign Up',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Or Connect With'),
                  SizedBox(height: 25),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/g.png',
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      height: 60,
                      color: Colors.white,
                      onPressed: () {},
                      borderRadius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // appBar: AppBar(),
    );
  }
}
