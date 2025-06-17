import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';

class SignUpController {
  bool isAdministrador = false;

  Future<String?> cadastrarUsuario(SignUpModel model) async {
    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(cred.user!.uid)
          .set({
        'uid': cred.user!.uid,
        'email': model.email,
        'cpf': model.cpf,
        'tipoCadastro': model.tipoCadastro ? 'admin' : 'coletador',
      });

      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }
}
