import 'package:coleta_portel/data/controller/rota_controller.dart';
import 'package:coleta_portel/data/models/rota_model.dart';
import 'package:coleta_portel/presentation/pages/rota_form/rota_form_page.dart';
import 'package:flutter/material.dart';

class RotaListPage extends StatefulWidget {
  @override
  State<RotaListPage> createState() => _RotaListPageState();
}

class _RotaListPageState extends State<RotaListPage> {
  final _controller = RotaController();

  Future<void> _irParaCadastro() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RotaFormPage()),
    );

    // Se a tela de cadastro retornar "true", atualiza a tela (opcional aqui com Stream)
    if (resultado == true) {
      setState(() {}); // força reconstrução (caso não use Stream)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotas Cadastradas')),
      body: StreamBuilder<List<RotaModel>>(
        stream: _controller.getRotasDoUsuarioStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final rotas = snapshot.data ?? [];
          return ListView.builder(
            itemCount: rotas.length,
            itemBuilder: (context, index) {
              final rota = rotas[index];
              return ListTile(
                title: Text('${rota.origem} → ${rota.destino}'),
                subtitle: Text('Cadastrada em: ${rota.dataCadastro}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _irParaCadastro,
        child: Icon(Icons.add),
      ),
    );
  }
}
