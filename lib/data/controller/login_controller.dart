import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  // TextControllers para os campos da UI
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Notifier para controlar o loading na UI
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// Tenta fazer login; em caso de erro retorna a mensagem de erro,
  /// caso contrário retorna `null`.
  Future<String?> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return 'E‑mail e senha não podem ficar vazios.';
    }

    isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      // retorna a mensagem de erro amigável para exibir na UI
      return e.message ?? 'Erro desconhecido ao fazer login.';
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    isLoading.dispose();
  }
}
