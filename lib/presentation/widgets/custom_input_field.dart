import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String hint;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    this.margin = const EdgeInsets.only(top: 27),
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 303,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F0),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF352555), width: 1),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          height: 1.4, // 140%
          letterSpacing: 0,
          color: Color(0xFF352555),
        ),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
