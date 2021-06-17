import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tacker/Pages/GoogleSignIn.dart';
import 'package:health_tacker/Pages/HomePage.dart';
import 'package:health_tacker/widgets/Button.dart';
import 'package:health_tacker/widgets/LinkButton.dart';
import 'package:health_tacker/widgets/input_field.dart';
import 'package:health_tacker/widgets/logo.dart';
import 'package:health_tacker/widgets/title_and_subtitle.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  signFunction(email, password) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print('llllllllllllllllll $user');
  }

  addData() {
    firestore.collection('User').doc('${_email.text}').set({
      'username': _username.text,
      'email': _email.text,
      'password': _password.text
    });
  }

  bool visibilityPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: Color(0xFFDBDBDB),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(
                    url: 'images/signup.jpg',
                    width: double.infinity,
                    height: 150,
                  ),
                  SizedBox(height: 25),
                  TitleName(
                    title: 'Sign Up Now',
                    subTitle: 'Please fill the Details and Create Account',
                  ),
                  SizedBox(height: 30),
                  InputField(
                    controller: _username,
                    isPassword: false,
                    hintText: 'Username',
                  ),
                  SizedBox(height: 18),
                  InputField(
                    controller: _email,
                    isPassword: false,
                    hintText: 'Email',
                  ),
                  SizedBox(height: 18),
                  InputField(
                    controller: _password,
                    hintText: 'Password',
                    isIcon: true,
                    icon: IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            visibilityPassword = !visibilityPassword;
                          });
                        }),
                    isPassword: visibilityPassword,
                    iconVisible: () {
                      setState(() {
                        visibilityPassword = !visibilityPassword;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 60,
                    width: double.infinity,
                    color: Colors.blueAccent,
                    onPressed: () {
                      addData();
                      signFunction('${_email.text}', '${_password.text}');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(
                                userEmail: _email.text,
                              )));
                    },
                  ),
                  SizedBox(height: 30),
                  LinkButton(
                    normalText: 'Already have an Account? ',
                    mainText: 'Log In',
                  ),
                  SizedBox(height: 15),
                  Text('Or'),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/g.png',
                            width: 30,
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Sign in',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      height: 45,
                      color: Colors.white,
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
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
