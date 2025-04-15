import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';
import 'exercises.dart'; // ✅ Import de la classe Exercise

/// Liste des images associées aux exercices.
final Map<String, String> exerciseImages = {
  "Bench Press (Barbell)": "assets/exercises/Pectoraux/developpe_couche.png",
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
class MuscleDetailScreen extends StatelessWidget {
  final String muscleName;
  final String imagePath;
  final List<String> exercises;

  const MuscleDetailScreen({
    Key? key,
    required this.muscleName,
    required this.imagePath,
    required this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(muscleName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(imagePath, width: 150, height: 150)),
            SizedBox(height: 20),
            Text(
              "Exercices pour $muscleName :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  String exercise = exercises[index];
                  String exerciseImage = exerciseImages[exercise] ?? "assets/exercises/default.png";

                  return GestureDetector(
                    onTap: () {
                      final exerciseObject = Exercise(
                        name: exercise,
                        description: 'Description à venir...',
                        imagePath: exerciseImage,
                        subZone: 'Tous les faisceaux',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailScreen(
                            exercise: exerciseObject,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Image.asset(
                          exerciseImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          exercise,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
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
