import 'package:flutter/material.dart';
import 'exercice_list_screen.dart';

class ShouldersDetailsScreen extends StatelessWidget {
  final Map<String, String> shouldersZones = {
    'Tout': 'assets/anatomie/epaule/epaule.png',
    'Avant des épaules': 'assets/anatomie/epaule/avant_epaule.png',
    'Latéral des épaules': 'assets/anatomie/epaule/lateral_epaule.png',
    'Arrière des épaules': 'assets/anatomie/epaule/arriere_epaule.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zones des Épaules")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: shouldersZones.entries.map((entry) {
            final String zoneName = entry.key;
            final String imagePath = entry.value;

            return GestureDetector(
              onTap: () {
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
