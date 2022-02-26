import 'package:flutter/material.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  double size;
  AppButton(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      this.text = 'Hi!',
      this.icon,
      this.isIcon = false,
      this.size = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == true
          ? Icon(
              icon,
              color: color,
            )
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}
