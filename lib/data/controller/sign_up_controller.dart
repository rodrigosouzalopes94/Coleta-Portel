import 'package:flutter/material.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';

class SignUpController {
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  bool isAdministrador = false;

  SignUpModel criarSignUpModel() {
    return SignUpModel(
      email: emailController.text.trim(),
      cpf: cpfController.text.trim(),
      password: passwordController.text,
      tipoCadastro: isAdministrador ? 'Administrador' : 'Coletador',
    );
  }

  void limparCampos() {
    emailController.clear();
    cpfController.clear();
    passwordController.clear();
    isAdministrador = false;
  }

  void dispose() {
    emailController.dispose();
    cpfController.dispose();
    passwordController.dispose();
  }
}
