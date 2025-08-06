import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String myText;
  final TextEditingController controller;
  final bool obscureText;
  final Color textColor;
  final bool isNumber;

  const CustomTextField({
    super.key,
    required this.myText,
    required this.controller,
    required this.isNumber,
    this.obscureText = false,
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: myText,
          border: const OutlineInputBorder(),
        ),
        style: TextStyle(color: textColor),
      ),
    );
  }
}
