import 'package:flutter/material.dart';

class BlueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 159,
          height: 147,
          decoration: ShapeDecoration(
            color: const Color(0xFF275190),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
