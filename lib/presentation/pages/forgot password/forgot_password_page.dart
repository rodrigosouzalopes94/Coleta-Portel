import 'package:coleta_portel/data/controller/reset_password_controller.dart';
import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:coleta_portel/presentation/widgets/blue_button.dart';
import 'package:coleta_portel/presentation/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ResetPasswordController _resetPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _resetPasswordController = ResetPasswordController();
  }

  @override
  void dispose() {
    _resetPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (_formKey.currentState?.validate() != true) return;

    setState(() => _loading = true);

    try {
      await _resetPasswordController.resetPassword();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => const CustomAlertDialog(
              title: "E-mail enviado",
              message:
                  "Verifique sua caixa de entrada para redefinir sua senha.",
              duration: Duration(seconds: 3),
            ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (_) => CustomAlertDialog(
              title: "Erro",
              message: e.toString(),
              duration: const Duration(seconds: 3),
            ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Redefinir Senha',
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF352555),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    hint: 'Digite seu e‑mail',
                    controller: _resetPasswordController.emailController,
                  ),
                ],
              ),
              if (_loading) const Center(child: CircularProgressIndicator()),
              if (!_loading)
                BlueButton(
                  text: 'Enviar e‑mail',
                  onPressed: _handleResetPassword,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
