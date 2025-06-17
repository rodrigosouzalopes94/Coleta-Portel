import 'package:coleta_portel/data/controller/user_controller.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';
import 'package:coleta_portel/presentation/widgets/custom_input_field.dart';
import 'package:coleta_portel/presentation/widgets/login_button.dart';
import 'package:coleta_portel/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _cpfCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl =
      TextEditingController(); // novo

  final UserController _userController = UserController();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool? _isAdmin;

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

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: onToggle,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator:
            (value) =>
                value == null || value.isEmpty ? 'Campo obrigatório' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // para evitar overflow em telas pequenas
            padding: const EdgeInsets.all(16),
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
                _buildPasswordField(
                  controller: _passwordCtrl,
                  hint: 'Senha',
                  obscure: _obscurePassword,
                  onToggle:
                      () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                ),
                _buildPasswordField(
                  controller: _confirmPasswordCtrl,
                  hint: 'Confirme sua senha',
                  obscure: _obscureConfirmPassword,
                  onToggle:
                      () => setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      ),
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
                LoginButton(
                  text: _loading ? 'Carregando...' : 'Cadastrar',
                  onPressed: _loading ? null : _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
