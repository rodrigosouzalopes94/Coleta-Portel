import 'package:flutter/material.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:coleta_portel/presentation/widgets/email_field.dart';
import 'package:coleta_portel/presentation/widgets/password_field.dart';
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
            ValueListenableBuilder<bool>(
              valueListenable: loginController.isLoading,
              builder: (context, isLoading, child) {
                return ElevatedButton(
                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            final error = await loginController.login();
                            if (context.mounted) {
                              if (error == null) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.home,
                                );
                              } else {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(error)));
                              }
                            }
                          },
                  child:
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Entrar'),
                );
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
