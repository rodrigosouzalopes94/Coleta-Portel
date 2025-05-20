import 'package:coleta_portel/presentation/widgets/email_field.dart';
import 'package:coleta_portel/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:coleta_portel/data/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailField(controller: loginController),
            const SizedBox(height: 16),
            PasswordField(controller: loginController),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Ação de login
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
