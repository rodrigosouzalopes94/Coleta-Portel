import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Faz login com e-mail e senha
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Erro desconhecido ao fazer login.';
    }
  }

  /// Cria uma nova conta com e-mail e senha
  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Erro desconhecido ao criar conta.';
    }
  }

  /// Faz logout do usuário atual
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Verifica o usuário autenticado atual
  User? get currentUser => _auth.currentUser;
}
