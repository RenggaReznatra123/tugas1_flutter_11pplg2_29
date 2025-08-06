import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String myText;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.myText,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(myText, style: TextStyle(color: textColor)),
      ),
    );
  }
}
