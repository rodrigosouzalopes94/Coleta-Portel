import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewPasswordController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// Código recebido no e-mail (oobCode)
  final String oobCode;

  NewPasswordController({required this.oobCode});

  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  /// Valida se as senhas coincidem
  bool validatePasswords() {
    return newPasswordController.text.trim() ==
        confirmPasswordController.text.trim();
  }

  /// Atualiza a senha no Firebase usando o código de redefinição
  Future<void> changePassword() async {
    final newPassword = newPasswordController.text.trim();

    if (newPassword.isEmpty) {
      throw FirebaseAuthException(
        code: 'empty-password',
        message: 'Por favor, informe uma nova senha.',
      );
    }
    if (newPassword.length < 6) {
      throw FirebaseAuthException(
        code: 'weak-password',
        message: 'A senha deve ter pelo menos 6 caracteres.',
      );
    }
    if (!validatePasswords()) {
      throw FirebaseAuthException(
        code: 'password-mismatch',
        message: 'As senhas não coincidem.',
      );
    }

    await FirebaseAuth.instance.confirmPasswordReset(
      code: oobCode,
      newPassword: newPassword,
    );
  }
}
