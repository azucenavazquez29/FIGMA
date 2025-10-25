import 'package:flutter/material.dart';
import 'package:flutter_application_figma/theme/theme_notifier.dart';
import '../theme/theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required ThemeNotifier themeNotifier});

  @override
  Widget build(BuildContext context) {
    // Lista de parques favoritos de ejemplo
    final favorites = [
      'Parque Central',
      'Parque Verde',
      'Parque Lago',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: Text(favorites[index], style: const TextStyle(fontSize: 18)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      },
    );
  }
}