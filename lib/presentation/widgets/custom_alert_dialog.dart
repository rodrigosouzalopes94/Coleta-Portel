import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final IconData icon;

  const CustomAlertDialog({
    super.key,
    required this.message,
    this.icon = Icons.mark_email_read_outlined,
    required String title,
    required Duration duration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 321,
        height: 157,
        decoration: ShapeDecoration(
          color: const Color(0xFFF5F4F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 42,
              top: 99,
              child: SizedBox(
                width: 237,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF352555),
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 118,
              top: 6,
              child: SizedBox(
                width: 73,
                height: 73,
                child: Icon(icon, size: 60, color: Color(0xFF352555)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
