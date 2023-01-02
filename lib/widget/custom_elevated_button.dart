import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.textColor,
      required this.buttonColor,
      required this.fontSize,
      required this.buttonSize})
      : super(key: key);

  final String title;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double fontSize;
  final Size buttonSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor, minimumSize: buttonSize),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ));
  }
}
