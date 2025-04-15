import 'package:flutter/material.dart';
import '../../exercise_descriptions.dart'; // nouvelle source d'exos
import '../../exercice_list_screen.dart'; // ton écran d'affichage des exos filtrés

class PectorauxDetailsScreen extends StatelessWidget {
  final Map<String, String> pectorauxZones = {
    'Tout': 'assets/anatomie/pec/tout_pec.png',
    'Haut des pectoraux': 'assets/anatomie/pec/haut_pec.png',
    'Milieu des pectoraux': 'assets/anatomie/pec/milieu_pec.png',
    'Bas des pectoraux': 'assets/anatomie/pec/bas_pec.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zones des Pectoraux")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: pectorauxZones.entries.map((entry) {
            final String zoneName = entry.key;
            final String imagePath = entry.value;

            return GestureDetector(
              onTap: () {
                // 🔁 Tu peux filtrer ici si tu veux afficher direct les exos filtrés
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseListScreen(muscleName: zoneName),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    zoneName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
