import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordController {
  final TextEditingController emailController = TextEditingController();

  /// Envia o e‑mail de redefinição de senha para o Firebase Auth.
  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      throw FirebaseAuthException(
        code: 'empty-email',
        message: 'Por favor, informe um e‑mail válido.',
      );
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  void dispose() {
    emailController.dispose();
  }
}
