import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String exerciseName;
  final String imagePath;

  const ExerciseDetailScreen({
    Key? key,
    required this.exerciseName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exerciseName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(imagePath, width: 200, height: 200)),
            SizedBox(height: 20),
            Text(
              "Description de l'exercice :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Cet exercice cible principalement les muscles du ${exerciseName.contains('Squat') ? 'bas du corps' : 'haut du corps'}. Assurez-vous de bien maîtriser la technique avant d'augmenter la charge.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
