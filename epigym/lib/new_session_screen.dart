import 'package:flutter/material.dart';

/// Écran permettant de démarrer une nouvelle session.
///
/// Ce widget affiche un écran avec un titre "New Session" dans la barre d'application
/// et un message de bienvenue centré sur l'écran indiquant que l'utilisateur se trouve
/// dans une nouvelle session.
class NewSessionScreen extends StatelessWidget {
  /// Crée une instance de [NewSessionScreen].
  ///
  /// Ce constructeur est celui par défaut pour [NewSessionScreen] et n'accepte
  /// aucun paramètre.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Le titre de la barre d'application.
        title: Text("New Session"),
      ),
      body: Center(
        child: Text(
          /// Le texte affiché au centre de l'écran.
          "Bienvenue dans la nouvelle session !",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
