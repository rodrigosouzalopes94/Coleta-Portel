import 'package:coleta_portel/data/controller/user_controller.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';
import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:coleta_portel/presentation/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool? _isAdmin; // null = nenhum, true = admin, false = coletador

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _isAdmin == null) return;
    setState(() => _loading = true);

    final model = SignUpModel(
      email: _emailCtrl.text.trim(),
      cpf: _cpfCtrl.text.trim(),
      password: _passwordCtrl.text,
      tipoCadastro: _isAdmin!, // true ou false
    );

    final error = await _userController.createUser(model);
    setState(() => _loading = false);

    if (error == null) {
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
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              RegisterButton(
                text: _loading ? 'Carregando...' : 'Cadastrar',
                onPressed: _loading ? null : _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
