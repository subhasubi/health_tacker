import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tacker/Pages/HomePage.dart';
import 'package:health_tacker/widgets/Button.dart';
import 'package:health_tacker/widgets/LinkButton.dart';
import 'package:health_tacker/widgets/input_field.dart';
import 'package:health_tacker/widgets/logo.dart';
import 'package:health_tacker/widgets/title_and_subtitle.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Logo(url: 'images/signup.jpg'),
                  SizedBox(
                    height: 40,
                  ),
                  TitleName(
                    title: 'Sign Up Now',
                    subTitle: 'Please fill the Details and Create Account',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputField(
                    controller: _username,
                    isPassword: false,
                    hintText: 'Username',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputField(
                    controller: _email,
                    isPassword: false,
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 40,
                  ),
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
                  SizedBox(
                    height: 40,
                  ),
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
                  SizedBox(
                    height: 40,
                  ),
                  LinkButton(
                    normalText: 'Already have an Account? ',
                    mainText: 'Log In',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Or'),
                  SizedBox(
                    height: 40,
                  ),
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
                            width: 40,
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      height: 50,
                      color: Colors.white,
                      onPressed: () {},
                      borderRadius: 5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
