import 'package:coleta_portel/data/controller/sign_up_controller.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';
import 'package:coleta_portel/presentation/widgets/blue_button.dart';
import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailCtrl = TextEditingController();
  final _cpfCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = SignUpController();

  bool _loading = false;
  bool? _isAdmin;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _cpfCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _isAdmin == null) return;

    if (_passwordCtrl.text != _confirmPasswordCtrl.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('As senhas não coincidem')));
      return;
    }

    setState(() => _loading = true);

    final model = SignUpModel(
      email: _emailCtrl.text.trim(),
      cpf: _cpfCtrl.text.trim(),
      password: _passwordCtrl.text,
      tipoCadastro: _isAdmin!,
    );

    final error = await _signUpController.cadastrarUsuario(model);

    setState(() => _loading = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
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
      appBar: AppBar(
        leading: BackButton(),
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
                'Cadastro',
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF352555),
                ),
              ),
              const SizedBox(height: 20),
              CustomInputField(controller: _emailCtrl, hint: 'E-mail'),
              CustomInputField(controller: _cpfCtrl, hint: 'CPF'),
              CustomInputField(controller: _passwordCtrl, hint: 'Senha'),
              CustomInputField(
                controller: _confirmPasswordCtrl,
                hint: 'Confirmar Senha',
              ),
              const SizedBox(height: 20),
              Text(
                'Eu sou:',
                style: GoogleFonts.quicksand(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF352555),
                ),
              ),
              CheckboxListTile(
                title: const Text('Administrador'),
                value: _isAdmin == true,
                activeColor: const Color(0xFF352555),
                onChanged: (_) => setState(() => _isAdmin = true),
              ),
              CheckboxListTile(
                title: const Text('Coletador'),
                value: _isAdmin == false,
                activeColor: const Color(0xFF352555),
                onChanged: (_) => setState(() => _isAdmin = false),
              ),
              const SizedBox(height: 30),
              BlueButton(
                text: _loading ? 'Carregando...' : 'Cadastrar',
                onPressed: _loading ? null : _submit,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
