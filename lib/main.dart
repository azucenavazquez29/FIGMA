import 'package:flutter/material.dart';
import 'package:flutter_application_figma/screens/login_screen.dart';
import 'package:flutter_application_figma/screens/home_screen.dart';
import 'package:flutter_application_figma/screens/map_screen.dart';
import 'package:flutter_application_figma/screens/profile_screen.dart';
import 'package:flutter_application_figma/screens/favorites_screen.dart';
import 'package:flutter_application_figma/screens/settings_screen.dart';
import 'theme/theme_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // 🔹 Inicializamos el ThemeNotifier con modo claro
  final ThemeNotifier themeNotifier = ThemeNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mi App Completa',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentTheme,
          initialRoute: '/login', // 🔹 Inicia en Login
          routes: {
            '/login': (context) => LoginScreen(themeNotifier: themeNotifier),
            '/home': (context) => HomeScreen(themeNotifier: themeNotifier),
            '/map': (context) => MapScreen(themeNotifier: themeNotifier),
            '/profile': (context) => ProfileScreen(themeNotifier: themeNotifier),
            '/favorites': (context) => FavoritesScreen(themeNotifier: themeNotifier),
            '/settings': (context) => SettingsScreen(themeNotifier: themeNotifier),
          },
        );
      },
    );
  }
}