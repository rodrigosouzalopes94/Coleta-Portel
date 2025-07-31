import 'package:coleta_portel/core/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final AuthService _authService = AuthService();

  Future<Map<String, dynamic>?> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return {'error': 'E‑mail e senha não podem ficar vazios.'};
    }

    isLoading.value = true;
    try {
      return await _authService.signIn(email, password);
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
