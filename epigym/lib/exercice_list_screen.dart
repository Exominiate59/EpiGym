import 'package:flutter/material.dart';

/// Écran affichant une liste d'exercices pour un muscle spécifique.
///
/// Actuellement, cette liste est **spécifique aux pectoraux**.
/// Elle affiche les exercices sous forme de `ListTile` avec une image, un titre et une catégorie.
class ExerciseListScreen extends StatelessWidget {
  /// Nom du muscle sélectionné.
  final String muscleName;

  /// Crée un écran affichant les exercices pour le muscle donné.
  ///
  /// @param muscleName Le nom du muscle sélectionné.
  ExerciseListScreen({required this.muscleName});

  /// Liste des exercices **uniquement pour les pectoraux**.
  ///
  /// Chaque exercice est un `Map` contenant :
  /// - `"name"` : Le nom de l'exercice.
  /// - `"category"` : La catégorie de l'exercice.
  /// - `"image"` : Le chemin vers l'image associée.
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
      /// Barre d'application affichant le nom du muscle sélectionné.
      appBar: AppBar(title: Text(muscleName)),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Titre de la section
            Text(
              "Exercices pour les Pectoraux",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            /// Liste verticale des exercices
            Expanded(
              child: ListView.builder(
                itemCount: chestExercises.length,
                itemBuilder: (context, index) {
                  var exercise = chestExercises[index];

                  return GestureDetector(
                    onTap: () {
                      // Action lorsqu'on clique sur un exercice (ex: ouvrir un détail)
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),

                        /// Image ronde à gauche
                        leading: ClipOval(
                          child: Image.asset(
                            exercise["image"] ?? "",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// Nom de l'exercice
                        title: Text(
                          exercise["name"] ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        /// Catégorie de l'exercice
                        subtitle: Text(
                          exercise["category"] ?? "",
                          style: TextStyle(color: Colors.grey),
                        ),

                        /// Icône cliquable à droite
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
