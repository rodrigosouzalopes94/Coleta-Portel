import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const WhiteButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 303,
          height: 60,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(width: 1, color: Color(0xFF275190)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            child: Stack(
              children: [
                // Texto centralizado
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      height: 28 / 23,
                      letterSpacing: 0.2,
                      color: const Color(0xFF275190),
                    ),
                  ),
                ),

                // Shape no canto direito
                Positioned(
                  right: 20,
                  top: 15,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: deprecated_member_use
                      color: const Color(0xFF275190).withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFF275190),
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
