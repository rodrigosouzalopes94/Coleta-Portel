import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueButton extends StatelessWidget {
  final Future<void> Function()? onPressed;
  final String text;

  const BlueButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 303,
          height: 60,
          child: ElevatedButton(
            onPressed: onPressed == null ? null : () => onPressed!(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF275190),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      height: 28 / 23,
                      letterSpacing: 0.2,
                      color: const Color(0xFFF5F4F0),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF5F4F0).withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFF5F4F0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
