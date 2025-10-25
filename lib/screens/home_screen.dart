import 'package:flutter/material.dart';
import 'package:flutter_application_figma/theme/theme_notifier.dart';
import '../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required ThemeNotifier themeNotifier});

  final List<Map<String, String>> parques = const [
    {'nombre': 'Parque Central', 'imagen': 'assets/parque.jpg', 'distancia': '0.5 km'},
    {'nombre': 'Parque Verde', 'imagen': 'assets/parque2.png', 'distancia': '1.2 km'},
    {'nombre': 'Parque Lago', 'imagen': 'assets/parque3.png', 'distancia': '2 km'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: AppColors.primary,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/coco.png')),
                  SizedBox(height: 12),
                  Text('COCO', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('coco@example.com', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.park),
              title: const Text('Parques'),
              onTap: () => Navigator.pushNamed(context, '/maps'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Fondo con huella de perrito
          Opacity(
            opacity: 0.05,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/huella.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('¡Bienvenido, COCO!',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  // Banner principal
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/parque.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white70, borderRadius: BorderRadius.circular(30)),
                          child: const Icon(Icons.location_on, color: Colors.red, size: 28),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Parques Cercanos
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Parques Cercanos',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: parques.length,
                      itemBuilder: (context, index) {
                        final parque = parques[index];
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage(parque['imagen']!), fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(parque['nombre']!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      Text(parque['distancia']!,
                                          style: const TextStyle(
                                              color: Colors.white70, fontSize: 12)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Explora los parques cercanos y disfruta de tu tiempo al aire libre con tu perro.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}