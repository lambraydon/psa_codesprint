class EmployeeRecommenderModel {
  final String description;

  EmployeeRecommenderModel({
    required this.description,
  });

  factory EmployeeRecommenderModel.fromJson(Map<dynamic, dynamic> json) {
    return EmployeeRecommenderModel(
      description: json['description'] as String,
    );
  }
}
