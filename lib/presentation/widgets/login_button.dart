import 'package:coleta_portel/data/controller/login_controller.dart';
import 'package:coleta_portel/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final LoginController controller;
  const LoginButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Entrar'),
      onPressed: () async {
        final success = await controller.login();
        if (success && context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Falha no login')));
        }
      },
    );
  }
}
