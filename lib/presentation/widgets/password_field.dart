// lib/presentation/pages/login/widgets/password_field.dart

import 'package:coleta_portel/data/controller/login_controller.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final LoginController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.passwordCtrl,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }
}
