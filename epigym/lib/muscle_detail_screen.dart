import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

/// Liste des images associées aux exercices.
final Map<String, String> exerciseImages = {
  "Bench Press (Smith)": "assets/exercises/Pectoraux/developpé_couche.png",
  "Push up": "assets/exercises/Pectoraux/pompes.png",
  "Chest fly (Dumbbell)": "assets/exercises/Pectoraux/ecarte_couche_haltere.png",
  "Chest Dips": "assets/exercises/Pectoraux/dips.png",
  "Chest Fly (Machine)": "assets/exercises/Pectoraux/pec_deck.png",
  "Biceps Curl (Dumbbell)": "assets/exercises/biceps/curl_haltere.png",
  "Harmmer Curl": "assets/exercises/biceps/curl_marteau.png",
  "Biceps Curl (Barbell)": "assets/exercises/biceps/curl_barre.png",
  "Biceps Curl (Cable)": "assets/exercises/biceps/curl_poulie.png",
  "Triceps Dips": "assets/exercises/triceps/triceps_dips.png",
  "Extensions poulie corde": "assets/exercises/triceps/extension_triceps_corde.png",
  "Skull crushers (Barbell)": "assets/exercises/triceps/skull_crushers.png",
  "JM Press (Smith)": "assets/exercises/triceps/jm_press.png",
  "Seated Overhead Press (Dumbbel)": "assets/exercises/shoulders/seated_overhead_press.png",
  "Lateral Raise (Dumbell)": "assets/exercises/shoulders/lateral_raise_dumbell.png",
  "Lateral Raise (Cable)": "assets/exercises/shoulders/lateral_raise_cable.png",
  "Face Pull (Cable)" : "assets/exercises/shoulders/face_pull_cable.png",
  "Rowing (Machine)": "assets/exercises/Trapezius/rowing_machine.png",
  "Rowing (Barbell)": "assets/exercises/Trapezius/rowing_barre.png",
  "T Bar Row Chest Supported": "assets/exercises/Trapezius/t_bar_row_supported.png",
  "Shrug (Dumbbel)": "assets/exercises/Trapezius/shrug_haltere.png",
  "Squat": "assets/exercises/squat.png",
  "Fentes": "assets/exercises/fentes.png",
};

/// Écran affichant les détails d'un groupe musculaire et la liste des exercices associés.
///
/// Cet écran présente :
/// - Une image du muscle ciblé.
/// - Une liste d'exercices spécifiques à ce muscle.
/// - La possibilité de naviguer vers l'écran de détail de chaque exercice.
///
/// Les exercices sont récupérés dynamiquement en fonction du groupe musculaire sélectionné.
class MuscleDetailScreen extends StatelessWidget {
  /// Nom du groupe musculaire.
  final String muscleName;

  /// Image représentant le groupe musculaire.
  final String imagePath;

  /// Liste des exercices associés à ce muscle.
  final List<String> exercises;

  /// Constructeur de l'écran `MuscleDetailScreen`.
  ///
  /// - [muscleName] : Nom du muscle affiché en haut de l'écran.
  /// - [imagePath] : Image représentant le muscle sélectionné.
  /// - [exercises] : Liste des exercices correspondant à ce muscle.
  const MuscleDetailScreen({
    Key? key,
    required this.muscleName,
    required this.imagePath,
    required this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barre d'application affichant le nom du muscle.
      appBar: AppBar(title: Text(muscleName)),

      /// Contenu principal de la page.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Affiche l'image du muscle ciblé.
            Center(child: Image.asset(imagePath, width: 150, height: 150)),
            SizedBox(height: 20),

            /// Titre indiquant la liste des exercices.
            Text(
              "Exercices pour $muscleName :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            /// Liste des exercices associés au muscle.
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  String exercise = exercises[index];
                  String exerciseImage = exerciseImages[exercise] ?? "assets/exercises/default.png";

                  return GestureDetector(
                    /// Navigation vers l'écran de détail de l'exercice sélectionné.
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailScreen(
                            exerciseName: exercise,
                            imagePath: exerciseImage,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),

                        /// Image de l'exercice.
                        leading: Image.asset(
                          exerciseImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),

                        /// Nom de l'exercice.
                        title: Text(
                          exercise,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),

                        /// Icône pour indiquer la navigation.
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
