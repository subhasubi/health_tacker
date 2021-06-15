import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.child,
      this.color = Colors.redAccent,
      this.borderRadius = 5,
      this.width = 300,
      this.height = 40,
      this.onPressed});

  double? height;
  double? width;
  double? borderRadius;
  Color? color;
  VoidCallback? onPressed;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: child,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!)),
      elevation: 10,
      color: color,
      onPressed: onPressed,
    );
  }
}
