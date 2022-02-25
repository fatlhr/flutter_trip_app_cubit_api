import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  Color color;

  final String text;

  AppLargeText(
      {Key? key, this.size = 30, this.color = Colors.black, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size, color: color, fontWeight: FontWeight.bold));
  }
}
