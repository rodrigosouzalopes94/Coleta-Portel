import 'package:flutter/material.dart';
import 'package:coleta_portel/data/controller/reset_password_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordButton extends StatefulWidget {
  final ResetPasswordController controller;

  const ResetPasswordButton({super.key, required this.controller});

  @override
  State<ResetPasswordButton> createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  bool _loading = false;

  Future<void> _onPressed() async {
    setState(() => _loading = true);
    try {
      await widget.controller.resetPassword();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E‑mail de redefinição enviado!')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Erro desconhecido.')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _loading ? null : _onPressed,
      child:
          _loading
              ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : const Text('Enviar link de redefinição'),
    );
  }
}
