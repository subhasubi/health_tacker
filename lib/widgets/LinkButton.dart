import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  LinkButton(
      {this.onPressed,
      this.normalTextColor = Colors.black,
      this.mainTextColor = Colors.blueAccent,
      this.mainText = '',
      this.normalText = ''});
  String? normalText;
  String? mainText;
  Color? normalTextColor;
  Color? mainTextColor;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: RichText(
          text: TextSpan(
              text: normalText,
              style: TextStyle(color: normalTextColor),
              children: [
                TextSpan(
                  text: mainText,
                  style: TextStyle(color: mainTextColor),
                ),
              ]),
        ),
        onTap: onPressed,
      ),
    );
  }
}
