import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/rota_model.dart';

class RotaController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> cadastrarRota(RotaModel rota) async {
    final user = _auth.currentUser;

    if (user == null) return 'Usuário não autenticado.';

    try {
      await _db.collection('rotas').add({
        ...rota.toMap(),
        'userId': user.uid, // associa a rota ao usuário logado
      });
      return null;
    } catch (e) {
      return 'Erro ao salvar rota: ${e.toString()}';
    }
  }

  Stream<List<RotaModel>> getRotasDoUsuarioStream() {
    final user = _auth.currentUser;
    if (user == null) return const Stream.empty();

    return _db
        .collection('rotas')
        .where('userId', isEqualTo: user.uid)
        .orderBy('dataCadastro', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => RotaModel.fromMap(doc.data()))
                  .toList(),
        );
  }
}
