import 'package:flutter/material.dart';
import 'package:flutter_application_figma/theme/theme_notifier.dart';
import '../theme/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required ThemeNotifier themeNotifier});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Configuración', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Card(
          child: ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Tema oscuro / claro'),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificaciones'),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
      ],
    );
  }
}