import 'package:flutter/material.dart';
import 'muscle_detail_screen.dart';

/// Écran permettant à l'utilisateur de sélectionner un groupe musculaire.
///
/// Chaque muscle est représenté par une image et un texte.
/// En appuyant dessus, l'utilisateur est redirigé vers une liste d'exercices spécifiques à ce muscle.
class MuscleSelectionScreen extends StatefulWidget {
  @override
  _MuscleSelectionScreenState createState() => _MuscleSelectionScreenState();
}

class _MuscleSelectionScreenState extends State<MuscleSelectionScreen> {
  /// Mapping des groupes musculaires avec leurs images respectives.
  final Map<String, String> muscleImages = {
    "Pectoraux": "assets/images/pectoraux.png",
    "Biceps": "assets/images/biceps.png",
    "Triceps": "assets/images/triceps.png",
    "Shoulders": "assets/images/shoulders.png",
    "Trapezius": "assets/images/trapezius.png",
    "Lats": "assets/images/lats.png",
    "Forearms": "assets/images/forearms.png",
    "Abdominals": "assets/images/abdominals.png",
    "Jambes": "assets/images/squat.png",
    "Abdominaux": "assets/images/crunch.png",
  };

  /// Liste des exercices associés à chaque muscle.
  final Map<String, List<String>> muscleExercises = {
    "Pectoraux": ["Bench Press (Barbell)", "Push up", "Chest fly (Dumbbell)", "Chest Dips", "Chest Fly (Machine)"],
    "Biceps": ["Biceps Curl (Dumbbell)", "Harmmer Curl", "Biceps Curl (Barbell)", "Biceps Curl (Cable)"],
    "Triceps": ["Triceps Dips", "Extensions poulie corde", "Skull crushers (Barbell)", "JM Press (Smith)"],
    "Shoulders": ["Seated Overhead Press (Dumbbel)", "Lateral Raise (Dumbell)", "Lateral Raise (Cable)", "Face Pull (Cable)"],
    "Trapezius": ["Rowing (Machine)", "Rowing (Barbell)", "T Bar Row Chest Supported", "Shrug (Dumbbel)"],
    "Lats": ["Pull up", "Lat Pulldown", "Seated Row", "Straight Arm Pulldown"],
    "Forearms": ["Wrist Curl", "Reverse Wrist Curl", "Hammer Curl", "Farmer's Walk"],
    "Abdominals": ["Crunch", "Plank", "Leg Raises", "Russian Twist"],
    "Jambes": ["Squat", "Presse à jambes", "Fentes", "Leg curl"],
    "Abdominaux": ["Crunch", "Planche", "Relevé de jambes", "Russian Twist"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercice")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 colonnes
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: muscleImages.keys.length,
          itemBuilder: (context, index) {
            String muscle = muscleImages.keys.elementAt(index);
            String imagePath = muscleImages[muscle] ?? "";
            List<String> exercises = muscleExercises[muscle] ?? [];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MuscleDetailScreen(
                      muscleName: muscle,
                      imagePath: imagePath,
                      exercises: exercises,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  /// Effet visuel avec `InkWell` pour un meilleur retour utilisateur.
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.3), // Effet de clic
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MuscleDetailScreen(
                                muscleName: muscle,
                                imagePath: imagePath,
                                exercises: exercises,
                              ),
                            ),
                          );
                        },
                        child: Ink.image(
                          image: AssetImage(imagePath),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Nom du muscle affiché sous l'image.
                  Text(
                    muscle,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
