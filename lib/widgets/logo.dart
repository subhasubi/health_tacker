import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo(
      {required this.url,
      this.borderRadius = 10,
      this.height = 100,
      this.width = 100});
  final String url;
  double? borderRadius;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: Image(fit: BoxFit.cover, image: AssetImage('$url')),
      ),
    );
  }
}
