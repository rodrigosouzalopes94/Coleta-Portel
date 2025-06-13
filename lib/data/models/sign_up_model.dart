// lib/presentation/pages/signup/model/signup_model.dart

class SignUpModel {
  final String email;
  final String cpf;
  final String password;
  final bool tipoCadastro;

  SignUpModel({
    required this.email,
    required this.cpf,
    required this.password,
    required this.tipoCadastro,
  });
}
