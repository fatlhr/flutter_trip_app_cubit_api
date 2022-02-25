import 'package:flutter/material.dart';

@immutable
class AppText extends StatelessWidget {
  double size;
  Color color;

  final String text;

  AppText(
      {Key? key, this.size = 14, this.color = Colors.grey, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size, color: color, fontWeight: FontWeight.normal));
  }
}
