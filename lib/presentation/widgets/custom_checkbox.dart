import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Color(0xFF352555),
        ),
      ),
      value: value,
      onChanged: (val) => onChanged(val ?? false),
      activeColor: const Color(0xFF352555),
    );
  }
}
