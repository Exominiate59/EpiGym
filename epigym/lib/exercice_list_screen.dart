import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';
import 'exercise_descriptions.dart'; // contient la liste centralisée
import 'exercises.dart';

class ExerciseListScreen extends StatelessWidget {
  final String muscleName;

  ExerciseListScreen({required this.muscleName});

  @override
  Widget build(BuildContext context) {
    // 🔎 Filtrage selon la zone sélectionnée
    final List<Exercise> filteredExercises = allExercises.where((ex) {
      if (muscleName == "Tout") return true;
      return ex.subZone == muscleName;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Exercices - $muscleName")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filteredExercises.isEmpty
            ? Center(child: Text("Aucun exercice trouvé pour $muscleName"))
            : ListView.builder(
          itemCount: filteredExercises.length,
          itemBuilder: (context, index) {
            final exercise = filteredExercises[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailScreen(
                      exercise: exercise,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      exercise.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    exercise.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    exercise.subZone,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
