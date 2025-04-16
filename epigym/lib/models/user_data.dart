class UserData {
  final int? id;
  final String gender;
  final int age;
  final double height;
  final double weight;
  final String activityLevel;
  final String goal;
  final double bmr;
  final double finalCalories;

  UserData({
    this.id,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.activityLevel,
    required this.goal,
    required this.bmr,
    required this.finalCalories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'activityLevel': activityLevel,
      'goal': goal,
      'bmr': bmr,
      'finalCalories': finalCalories,
    };
  }
}
