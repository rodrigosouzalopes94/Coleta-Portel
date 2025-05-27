import 'package:cloud_firestore/cloud_firestore.dart';

class RotaModel {
  final String origem;
  final String destino;
  final DateTime dataCadastro;

  RotaModel({
    required this.origem,
    required this.destino,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {'origem': origem, 'destino': destino, 'dataCadastro': dataCadastro};
  }

  factory RotaModel.fromMap(Map<String, dynamic> map) {
    return RotaModel(
      origem: map['origem'],
      destino: map['destino'],
      dataCadastro: (map['dataCadastro'] as Timestamp).toDate(),
    );
  }
}
