import 'package:coleta_portel/data/controller/rota_controller.dart';
import 'package:coleta_portel/data/models/rota_model.dart';
import 'package:flutter/material.dart';

class RotaFormPage extends StatefulWidget {
  @override
  _RotaFormPageState createState() => _RotaFormPageState();
}

class _RotaFormPageState extends State<RotaFormPage> {
  final _origemController = TextEditingController();
  final _destinoController = TextEditingController();
  final _controller = RotaController();

  void _salvarRota() async {
    final origem = _origemController.text.trim();
    final destino = _destinoController.text.trim();

    if (origem.isEmpty || destino.isEmpty) {
      _mostrarSnackBar('Preencha todos os campos', Colors.red);
      return;
    }

    final rota = RotaModel(
      origem: origem,
      destino: destino,
      dataCadastro: DateTime.now(),
    );

    final erro = await _controller.cadastrarRota(rota);

    if (erro == null) {
      _mostrarSnackBar('Rota cadastrada!', Colors.green);
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pop(context, true); // volta e sinaliza atualização
      });
    } else {
      _mostrarSnackBar(erro, Colors.red);
    }
  }

  void _mostrarSnackBar(String msg, Color cor) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: cor));
  }

  @override
  void dispose() {
    _origemController.dispose();
    _destinoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Rota')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _origemController,
              decoration: InputDecoration(labelText: 'Origem'),
            ),
            TextField(
              controller: _destinoController,
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _salvarRota, child: Text('Salvar Rota')),
          ],
        ),
      ),
    );
  }
}
