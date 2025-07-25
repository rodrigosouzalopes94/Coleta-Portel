import 'package:coleta_portel/data/controller/sign_up_controller.dart';
import 'package:coleta_portel/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coleta_portel/presentation/widgets/blue_button.dart';
import 'package:coleta_portel/presentation/widgets/white_button.dart';
import 'package:coleta_portel/presentation/pages/signup/signup_page.dart';
import 'package:coleta_portel/data/controller/login_controller.dart';

class StartPage extends StatelessWidget {
  final LoginController loginController = LoginController();
  final SignUpController signUpController = SignUpController();

  StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo
            Image.asset(
              'assets/images/home.jpg',
              width: 233,
              height: 350,
              errorBuilder: (_, __, ___) => const Text('Erro ao carregar logo'),
            ),
            const SizedBox(height: 20),

            // Texto "Bem Vindo"
            Text(
              'Bem Vindo',
              style: GoogleFonts.quicksand(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF275190),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Botão Login
            BlueButton(
              text: 'Login',
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  ),
            ),
            const SizedBox(height: 20),

            // Botão Cadastro
            WhiteButton(
              text: 'Cadastro',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
