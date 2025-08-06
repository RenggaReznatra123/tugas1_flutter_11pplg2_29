import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myLabel;
  final TextEditingController controller;
  final bool obscure;
  final Color textColor;

  const CustomText({
    super.key,
    required this.myLabel,
    required this.controller,
    this.obscure = false,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: myLabel,
          border: const OutlineInputBorder(),
        ),
        style: TextStyle(color: textColor),
      ),
    );
  }
}
