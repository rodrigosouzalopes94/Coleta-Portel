import 'dart:async';
import 'package:flutter/material.dart';

class ConfirmAlertDialog extends StatefulWidget {
  final VoidCallback onAutoRedirect;

  const ConfirmAlertDialog({super.key, required this.onAutoRedirect});

  @override
  State<ConfirmAlertDialog> createState() => _ConfirmAlertDialogState();
}

class _ConfirmAlertDialogState extends State<ConfirmAlertDialog> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), widget.onAutoRedirect);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFF5F4F0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Seu acesso foi permitido!\nVocê será redirecionado.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF352555),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
