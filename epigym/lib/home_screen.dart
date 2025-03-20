import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'new_session_screen.dart';
import 'my_routine_screen.dart';
import 'muscle_selection_screen.dart'; // Importation de la nouvelle page

/// Écran principal de l'application **Epigym**.
///
/// Cet écran permet d'accéder aux différentes fonctionnalités :
/// - Démarrer une nouvelle session.
/// - Voir sa routine d'entraînement.
/// - Accéder aux sessions pré-construites.
/// - Sélectionner des exercices.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barre d'application avec le logo et le titre.
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
            ),
            const SizedBox(width: 10),
            const Text(
              'Epigym',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      /// Contenu principal de l'écran.
      body: Stack(
        children: [
          /// Logo en arrière-plan avec opacité réduite.
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 500,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          /// Bouton pour démarrer une **nouvelle session**.
          createCustomButton(
            context: context,
            x: 100,
            y: 100,
            width: 200,
            height: 60,
            text: "New Session",
            color: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewSessionScreen()),
              );
            },
          ),

          /// Bouton pour afficher **la routine de l'utilisateur**.
          createCustomButton(
            context: context,
            x: 100,
            y: 300,
            width: 200,
            height: 60,
            text: "My Routine",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyRoutineScreen()),
              );
            },
          ),

          /// Bouton pour accéder aux **sessions pré-faites**.
          createCustomButton(
            context: context,
            x: 100,
            y: 500,
            width: 200,
            height: 60,
            text: "Pre-made Sessions",
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewSessionScreen()),
              );
            },
          ),

          /// Bouton pour accéder aux **exercices** via la sélection des muscles.
          createCustomButton(
            context: context,
            x: 100,
            y: 400,
            width: 200,
            height: 60,
            text: "Exercice",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MuscleSelectionScreen()), // Nouvelle page
              );
            },
          ),
        ],
      ),
    );
  }
}
