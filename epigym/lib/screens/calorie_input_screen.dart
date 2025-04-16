import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import '../models/user_data.dart';

class CalorieInputScreen extends StatefulWidget {
  @override
  _CalorieInputScreenState createState() => _CalorieInputScreenState();
}

class _CalorieInputScreenState extends State<CalorieInputScreen> {
  String? gender;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmr;
  double? finalCalories;
  double? activityFactor;
  int? goalAdjustment;

  String selectedActivity = 'Sédentaire (aucune activité)';
  String selectedGoal = 'Maintenir le poids';

  final activityLevels = {
    'Sédentaire (aucune activité)': 1.2,
    'Légèrement actif (1-3x/semaine)': 1.375,
    'Modérément actif (3-5x/semaine)': 1.55,
    'Très actif (6-7x/semaine)': 1.725,
    'Extrêmement actif (2x/jour ou +)': 1.9,
  };

  final goals = {
    'Perdre du poids': -300,
    'Maintenir le poids': 0,
    'Prendre du poids': 300,
  };

  void calculateCalories() {
    FocusScope.of(context).unfocus(); // <- force l'enregistrement du texte

    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);
    final int? age = int.tryParse(ageController.text);

    if (weight == null || height == null || age == null || gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Merci de remplir tous les champs")),
      );
      return;
    }

    double calculatedBmr;
    if (gender == 'Homme') {
      calculatedBmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      calculatedBmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    activityFactor = activityLevels[selectedActivity]!;
    goalAdjustment = goals[selectedGoal]!;

    setState(() {
      bmr = calculatedBmr;
      finalCalories = calculatedBmr * activityFactor! + goalAdjustment!;
    });
  }

  void saveToDatabase() async {
    if (bmr == null || finalCalories == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez d'abord calculer les calories")),
      );
      return;
    }

    final data = UserData(
      gender: gender!,
      age: int.parse(ageController.text),
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
      activityLevel: selectedActivity,
      goal: selectedGoal,
      bmr: bmr!,
      finalCalories: finalCalories!,
    );

    await DatabaseHelper.instance.insertUserData(data);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Données enregistrées avec succès")),
    );
  }

  void showPreviousData() async {
    final allData = await DatabaseHelper.instance.getAllUserData();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Historique des résultats"),
          content: SizedBox(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) {
                final data = allData[index];
                return ListTile(
                  title: Text(
                    "Poids: ${data.weight} kg\n"
                        "Taille: ${data.height} cm\n"
                        "Sexe: ${data.gender}\n"
                        "Âge: ${data.age} ans\n"
                        "Objectif: ${data.goal}\n"
                        "Activité: ${data.activityLevel}\n"
                        "Calories: ${data.finalCalories} kcal/jour",
                  ),
                  subtitle: Text("ID: ${data.id}"),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calcul des besoins caloriques")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sexe", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Homme"),
                    value: "Homme",
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Femme"),
                    value: "Femme",
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value),
                  ),
                ),
              ],
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Âge (années)"),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Taille (cm)"),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Poids (kg)"),
            ),
            const SizedBox(height: 20),
            Text("Niveau d'activité", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedActivity,
              items: activityLevels.keys.map((level) {
                return DropdownMenuItem(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedActivity = value!),
            ),
            const SizedBox(height: 20),
            Text("Objectif", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedGoal,
              items: goals.keys.map((goal) {
                return DropdownMenuItem(
                  value: goal,
                  child: Text(goal),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedGoal = value!),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: calculateCalories,
                child: Text("JE CALCULE"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: saveToDatabase,
                child: Text("SAUVEGARDER"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: showPreviousData,
                child: Text("HISTORIQUE"),
              ),
            ),
            if (bmr != null && finalCalories != null) ...[
              const SizedBox(height: 30),
              Text(
                "🔍 Résultat :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Métabolisme de base (MB) : ${bmr!.toStringAsFixed(0)} kcal/jour",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Facteur d'activité : x${activityFactor!.toStringAsFixed(3)}",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              Text(
                "Ajustement objectif : ${goalAdjustment! >= 0 ? '+$goalAdjustment' : '$goalAdjustment'} kcal",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 10),
              Text(
                "Besoins journaliers ajustés : ${finalCalories!.toStringAsFixed(0)} kcal/jour",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
