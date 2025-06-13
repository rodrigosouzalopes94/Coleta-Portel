import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coleta_portel/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createUser(SignUpModel model) async {
    try {
      // Cria o usuário no Firebase Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: model.email,
            password: model.password,
          );

      // Salva os dados adicionais no Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': model.email,
        'cpf': model.cpf,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      return e.message; // erro do Firebase
    } catch (e) {
      return 'Erro desconhecido: ${e.toString()}';
    }
  }
}
