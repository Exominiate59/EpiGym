import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart'; // ✅ Import du fichier de détails

class ExerciseListScreen extends StatelessWidget {
  final String muscleName;

  ExerciseListScreen({required this.muscleName});

  final List<Map<String, String>> chestExercises = [
    {
      "name": "Incline Chest Press",
      "category": "Chest",
      "image": "assets/images/incline_chest_press.png"
    },
    {
      "name": "Bench Press",
      "category": "Chest",
      "image": "assets/images/bench_press.png"
    },
    {
      "name": "Cable Fly",
      "category": "Chest",
      "image": "assets/images/cable_fly.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(muscleName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Exercices pour les Pectoraux",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: chestExercises.length,
                itemBuilder: (context, index) {
                  var exercise = chestExercises[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailScreen(
                            exerciseName: exercise["name"] ?? "",
                            imagePath: exercise["image"] ?? "",
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
                        leading: ClipOval(
                          child: Image.asset(
                            exercise["image"] ?? "",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          exercise["name"] ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          exercise["category"] ?? "",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
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
