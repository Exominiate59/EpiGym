import 'package:flutter/material.dart';
import 'muscle_detail_screen.dart'; // Import de la page des détails

class MuscleSelectionScreen extends StatefulWidget {
  @override
  _MuscleSelectionScreenState createState() => _MuscleSelectionScreenState();
}

class _MuscleSelectionScreenState extends State<MuscleSelectionScreen> {
  // Association des muscles à leurs images
  final Map<String, String> muscleImages = {
    "Pectoraux": "assets/images/developpe_couche.png",
    "Biceps": "assets/images/curl_biceps.png",
    "Triceps": "assets/images/dips_triceps.png",
    "Épaules": "assets/images/developpe_militaire.png",
    "Dos": "assets/images/traction.png",
    "Jambes": "assets/images/squat.png",
    "Abdominaux": "assets/images/crunch.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercice")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quel muscle souhaites-tu travailler ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            /// Affichage des muscles sous forme de boutons ronds
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images par ligne
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: muscleImages.keys.length,
                itemBuilder: (context, index) {
                  String muscle = muscleImages.keys.elementAt(index);
                  String imagePath = muscleImages[muscle] ?? "";

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MuscleDetailScreen(
                            muscleName: muscle,
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        /// Image arrondie et effet bouton
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: AssetImage(imagePath),
                              width: 80, // Taille de l’image
                              height: 80,
                              fit: BoxFit.cover,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MuscleDetailScreen(
                                        muscleName: muscle,
                                        imagePath: imagePath,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          muscle,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
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
