import 'package:flutter/material.dart';
import 'exercise_descriptions.dart';

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
    final String description = exerciseDescriptions[exerciseName] ??
        "Description non disponible pour cet exercice.";

    return Scaffold(
      appBar: AppBar(title: Text(exerciseName)),
      body: SingleChildScrollView( // ✅ scroll activé ici
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Description de l'exercice :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
