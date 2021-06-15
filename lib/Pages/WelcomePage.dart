import 'package:flutter/material.dart';
import 'package:health_tacker/widgets/Button.dart';
import 'package:health_tacker/widgets/LinkButton.dart';
import 'package:health_tacker/widgets/logo.dart';
import 'package:health_tacker/widgets/title_and_subtitle.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Logo(
              url: 'images/welcome.png',
              height: 300,
              width: 300,
              borderRadius: 10,
            ),
            TitleName(title: 'Welcome', subTitle: 'Track Your Personal Health'),
            CustomButton(
              child: Text(
                'Getting Started',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              width: double.infinity,
              height: 50,
              onPressed: () {},
            ),
            LinkButton(
              normalText: 'Already have an Account? ',
              mainText: ' Log In',
            )
          ],
        ),
      ),
    );
  }
}
