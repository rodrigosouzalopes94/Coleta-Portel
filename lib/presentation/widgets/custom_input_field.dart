import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomInputField({
    super.key,
    this.margin, // Agora é opcional
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 27),
      width: 303,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F0),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF352555), width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          height: 1.4,
          letterSpacing: 0,
          color: Color(0xFF352555),
        ),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
