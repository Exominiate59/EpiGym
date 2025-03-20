import 'package:flutter/material.dart';

/// Écran affichant les détails d'un exercice.
///
/// Cet écran affiche une image de l'exercice ainsi qu'une courte description.
/// Il adapte automatiquement la description en fonction du type d'exercice.
class ExerciseDetailScreen extends StatelessWidget {
  /// Nom de l'exercice.
  final String exerciseName;

  /// Chemin de l'image associée à l'exercice.
  final String imagePath;

  /// Crée un écran de détails pour un exercice donné.
  ///
  /// @param exerciseName Le nom de l'exercice.
  /// @param imagePath Le chemin de l'image associée à l'exercice.
  const ExerciseDetailScreen({
    Key? key,
    required this.exerciseName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barre d'application affichant le nom de l'exercice.
      appBar: AppBar(title: Text(exerciseName)),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Affichage de l'image au centre.
            Center(child: Image.asset(imagePath, width: 200, height: 200)),
            SizedBox(height: 20),

            /// Titre de la section description.
            Text(
              "Description de l'exercice :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            /// Texte de description dynamique en fonction du nom de l'exercice.
            Text(
              "Cet exercice cible principalement les muscles du "
                  "${exerciseName.contains('Squat') ? 'bas du corps' : 'haut du corps'}. "
                  "Assurez-vous de bien maîtriser la technique avant d'augmenter la charge.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
