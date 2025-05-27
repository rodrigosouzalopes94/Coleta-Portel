import 'package:coleta_portel/presentation/pages/rota_form/rota_form_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:coleta_portel/data/controller/home_controller.dart';
// ajuste o caminho se estiver diferente

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();
  final LatLng _startLocation = const LatLng(-3.3924, -52.4266); // Portel

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _mostrarSnackBarCadastro() {
    final snackBar = SnackBar(
      content: const Text('Deseja cadastrar uma nova rota?'),
      action: SnackBarAction(
        label: 'Cadastrar',
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RotaFormPage()),
          );

          if (resultado == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Rota salva com sucesso!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      ),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coleta Portel')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Mapa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.add_location),
              title: const Text('Nova Rota'),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer
                _mostrarSnackBarCadastro(); // Mostra o SnackBar
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _startLocation, zoom: 14),
        onMapCreated: (controller) => _controller.setMapController(controller),
        myLocationEnabled: true,
        zoomControlsEnabled: false,
      ),
    );
  }
}
