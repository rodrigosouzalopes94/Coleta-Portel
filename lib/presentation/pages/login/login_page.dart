import 'package:coleta_portel/data/controller/login_controller.dart';
import 'package:coleta_portel/presentation/widgets/blue_button.dart';
import 'package:coleta_portel/presentation/widgets/confirm_alert_dialog.dart';
import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:coleta_portel/presentation/widgets/white_button.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _loginController;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final result = await _loginController.login();

    setState(() => _loading = false);

    if (result == null || result['role'] == null) {
      _showError('Erro ao obter dados do usuário.');
      return;
    }

    if (result.containsKey('error')) {
      _showError(result['error']);
      return;
    }

    String route;
    switch (result['role']) {
      case 'admin':
        route = AppRoutes.AdminDashboard;
        break;
      case 'collector':
        route = AppRoutes.CollectorDashboard;
        break;
      default:
        _showError('Permissão desconhecida.');
        return;
    }

    // Exibe o diálogo e redireciona
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => ConfirmAlertDialog(
            onAutoRedirect: () {
              Navigator.pop(context); // Fecha o diálogo
              Navigator.pushReplacementNamed(context, route);
            },
          ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Login',
                style: GoogleFonts.quicksand(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF352555),
                ),
              ),
              const SizedBox(height: 40),
              CustomInputField(
                controller: _loginController.emailController,
                hint: 'E-mail',
                margin: EdgeInsets.zero,
              ),
              const SizedBox(height: 20),
              CustomInputField(
                controller: _loginController.passwordController,
                hint: 'Senha',
                obscureText: _obscurePassword,
                margin: EdgeInsets.zero,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    size: 22,
                    color: const Color(0xFF352555),
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
              ),
              const SizedBox(height: 10),
              BlueButton(
                text: _loading ? 'Entrando...' : 'Entrar',
                onPressed: _loading ? null : _submit,
              ),
              const SizedBox(height: 20),
              WhiteButton(
                text: 'Esqueceu sua senha?',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                child: const Text(
                  'Não tem conta? Cadastre-se',
                  style: TextStyle(color: Color(0xFF352555)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
