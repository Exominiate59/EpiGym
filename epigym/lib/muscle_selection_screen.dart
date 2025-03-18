import 'package:flutter/material.dart';
import 'muscle_detail_screen.dart'; // Import de la nouvelle page

class MuscleSelectionScreen extends StatefulWidget {
  @override
  _MuscleSelectionScreenState createState() => _MuscleSelectionScreenState();
}

class _MuscleSelectionScreenState extends State<MuscleSelectionScreen> {
  final List<String> muscles = [
    "Pectoraux",
    "Biceps",
    "Triceps",
    "Épaules",
    "Dos",
    "Jambes",
    "Abdominaux",
  ];

  String? selectedMuscle; // Stocke le muscle sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercice")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quel muscle souhaites-tu travailler ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            /// 🔽 **Dropdown pour sélectionner un muscle**
            DropdownButton<String>(
              hint: Text("Sélectionne un muscle"),
              value: selectedMuscle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMuscle = newValue;
                });

                // Ouvrir la page spécifique du muscle après sélection
                if (newValue != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MuscleDetailScreen(muscleName: newValue),
                    ),
                  );
                }
              },
              items: muscles.map((String muscle) {
                return DropdownMenuItem<String>(
                  value: muscle,
                  child: Text(muscle),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
