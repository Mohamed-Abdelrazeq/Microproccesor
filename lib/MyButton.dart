import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  MyButton({
    @required this.text,
    @required this.buttonColor,
    @required this.textColor,
  });

  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: "DS-DIGIT"
          ),
        ),
      ),
    );
  }
}
