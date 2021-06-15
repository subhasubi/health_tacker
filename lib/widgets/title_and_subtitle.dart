import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  TitleName({required this.title, required this.subTitle});

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            )),
        Text(subTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            )),
      ],
    );
  }
}
