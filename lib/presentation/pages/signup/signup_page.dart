// lib/presentation/pages/signup/signup_page.dart

import 'package:coleta_portel/data/controller/user_controller.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:coleta_portel/routes/app_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _cpfCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final UserController _userController = UserController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final model = SignUpModel(
      email: _emailCtrl.text.trim(),
      cpf: _cpfCtrl.text.trim(),
      password: _passwordCtrl.text,
    );

    final error = await _userController.createUser(model);
    setState(() => _loading = false);

    if (error == null) {
      // Após cadastro, vai para a home ou login:
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (v) =>
                        v != null && v.contains('@') ? null : 'Email inválido',
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _cpfCtrl,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                validator:
                    (v) =>
                        v != null && v.length == 11
                            ? null
                            : 'CPF deve ter 11 dígitos',
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator:
                    (v) =>
                        v != null && v.length >= 6 ? null : 'Senha muito curta',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  child:
                      _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
