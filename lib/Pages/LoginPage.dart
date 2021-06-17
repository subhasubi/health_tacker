import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFDBDBDB),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Logo(
                  url: 'images/login.jpg',
                  height: 200,
                  width: 300,
                  borderRadius: 10,
                ),
                TitleName(
                  title: 'Log In Now',
                  subTitle: 'Please Log In to continue using our App',
                ),
                InputField(
                  isPassword: false,
                  hintText: 'Email',
                ),
                InputField(
                  hintText: 'Password',
                  isIcon: true,
                ),
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
                CustomButton(
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 60,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  onPressed: () {},
                ),
                LinkButton(
                  normalText: 'Don\'t have an Account? ',
                  mainText: 'Sign Up',
                ),
                Text('Or Connect With'),
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
      // appBar: AppBar(),
    );
  }
}
