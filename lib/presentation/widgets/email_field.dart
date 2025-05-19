// lib/presentation/pages/login/widgets/email_field.dart

import 'package:coleta_portel/data/controller/login_controller.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final LoginController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
