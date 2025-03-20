import 'package:flutter/material.dart';

/// Écran représentant la routine de l'utilisateur.
///
/// Ce widget affiche un écran avec un titre "My Routine" dans la barre d'application
/// et un message de bienvenue centré sur l'écran.
class MyRoutineScreen extends StatelessWidget {
  /// Crée une instance de [MyRoutineScreen].
  ///
  /// Ce constructeur est celui par défaut pour [MyRoutineScreen] et n'accepte
  /// aucun paramètre.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Le titre de la barre d'application.
        title: Text("My Routine"),
      ),
      body: Center(
        child: Text(
          /// Le texte affiché au centre de l'écran.
          "Bienvenue dans My Routine",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
