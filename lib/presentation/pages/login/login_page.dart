import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:coleta_portel/data/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController loginController;

  @override
  void initState() {
    super.initState();
    loginController = LoginController();
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInputField(
              controller: loginController.emailController,
              hint: 'E-mail',
            ),
            const SizedBox(height: 16),
            CustomInputField(
              controller: loginController.passwordController,
              hint: 'Senha',
            ),
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
