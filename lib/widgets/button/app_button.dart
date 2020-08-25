import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String label;
  final double fontSize;
  final Color textColor;
  final Function onPressed;

  AppButton(
    this.label,
    this.onPressed, {
    this.color = Colors.blue,
    this.fontSize = 22,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: color,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
