import 'package:coleta_portel/presentation/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:coleta_portel/data/controller/reset_password_controller.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final ResetPasswordController _controller = ResetPasswordController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validateEmail(String? v) {
    if (v == null || !v.contains('@')) return 'E‑mail inválido';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Redefinir Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'E‑mail',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              const SizedBox(height: 24),
              // O botão usa o controller para disparar o reset
              BlueButton(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
