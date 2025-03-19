import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

// Liste des images des exercices
final Map<String, String> exerciseImages = {
  "Développé couché": "assets/images/developpe_couche.png",
  "Pompes": "assets/exercises/pompes.png",
  "Écarté couché": "assets/exercises/ecarte_couche.png",
  "Dips": "assets/exercises/dips.png",
  "Pec Deck": "assets/exercises/pec_deck.png",
  "Curl haltères": "assets/exercises/curl_haltere.png",
  "Curl marteau": "assets/exercises/curl_marteau.png",
  "Tractions supination": "assets/exercises/traction_supination.png",
  "Curl poulie": "assets/exercises/curl_poulie.png",
  "Squat": "assets/exercises/squat.png",
  "Fentes": "assets/exercises/fentes.png",
};

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
            Text("Exercices pour $muscleName :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  String exercise = exercises[index];
                  String exerciseImage = exerciseImages[exercise] ?? "assets/exercises/default.png";

                  return GestureDetector(
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
                        leading: Image.asset(exerciseImage, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(exercise, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
