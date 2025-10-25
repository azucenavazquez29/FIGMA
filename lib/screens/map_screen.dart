import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/theme.dart';
import '../theme/theme_notifier.dart';
import '../database/db_helper.dart'; // Aquí va tu CRUD de parques y reservaciones
import '../models/parque.dart';
import '../models/reservacion.dart';

class MapsScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  const MapsScreen({super.key, required this.themeNotifier});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _mapController;
  List<Marker> _markers = [];
  List<Parque> _parques = [];

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(19.432608, -99.133209), // Centro de CDMX
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _loadParques();
  }

  // Cargar parques desde la base de datos y crear marcadores
  Future<void> _loadParques() async {
    final parques = await DBHelper.getParques(); // Tu método CRUD
    setState(() {
      _parques = parques;
      _markers = parques.map((parque) {
        return Marker(
          markerId: MarkerId(parque.id.toString()),
          position: LatLng(parque.lat, parque.lng),
          infoWindow: InfoWindow(title: parque.nombre),
          onTap: () => _showParqueDetails(parque),
        );
      }).toList();
    });
  }

  // Mostrar BottomSheet con detalles del parque y sus reservaciones
  void _showParqueDetails(Parque parque) async {
    final reservaciones = await DBHelper.getReservacionesByParque(parque.id);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(parque.nombre,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(parque.direccion),
              const SizedBox(height: 10),
              const Text('Reservaciones:', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: reservaciones.length,
                  itemBuilder: (context, index) {
                    final r = reservaciones[index];
                    return ListTile(
                      leading: const Icon(Icons.pets),
                      title: Text(r.nombreCliente),
                      subtitle: Text(
                          'Fecha: ${r.fecha.day}/${r.fecha.month}/${r.fecha.year}'),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parques para perros'),
        backgroundColor: AppColors.primary,
      ),
      body: Stack(
        children: [
          // Fondo sutil tipo Figma
          Opacity(
            opacity: 0.05,
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                image: const DecorationImage(
                  image: AssetImage('assets/huella.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Google Maps
          GoogleMap(
            initialCameraPosition: _initialPosition,
            markers: Set<Marker>.of(_markers),
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
          ),
        ],
      ),
    );
  }
}