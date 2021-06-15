import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBDBDB),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Logo(url: 'images/logo.png'),
                TitleName(
                  title: 'Sign Up Now',
                  subTitle: 'Please fill the Details and Create Account',
                ),
                InputField(
                  isPassword: false,
                  hintText: 'Username',
                ),
                InputField(
                  isPassword: false,
                  hintText: 'Email',
                ),
                InputField(
                  hintText: 'Password',
                  isIcon: true,
                  icon: Icons.visibility_off,
                ),
                CustomButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 60,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  onPressed: () {},
                ),
                LinkButton(
                  normalText: 'Already have an Account? ',
                  mainText: 'Log In',
                ),
                Text('Or'),
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
