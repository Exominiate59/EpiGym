import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Point d'entrée de l'application **Epigym**.
void main() {
  runApp(MyApp());
}

/// Classe principale de l'application Epigym.
///
/// Cette application utilise un **thème sombre forcé** et affiche
/// l'écran d'accueil (`HomeScreen`) au démarrage.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Nom de l'application.
      title: 'Epigym',

      /// Définition du thème clair (non utilisé ici).
      theme: ThemeData.light(),

      /// Définition du thème sombre.
      darkTheme: ThemeData.dark(),

      /// Mode forcé sur **thème sombre**.
      themeMode: ThemeMode.dark,

      /// Premier écran affiché : `HomeScreen`.
      home: HomeScreen(),
    );
  }
}
