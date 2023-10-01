class RecommenderModel {
  final int totalScore;
  final int impactScore;
  final int competencyScore;
  final int experienceScore;
  final String description;

  RecommenderModel(
      {required this.totalScore,
      required this.impactScore,
      required this.competencyScore,
      required this.experienceScore,
      required this.description});

  factory RecommenderModel.fromJson(Map<dynamic, dynamic> json) {
    return RecommenderModel(
      totalScore: json['score'] as int,
      impactScore: json['impact score'] as int,
      competencyScore: json['competency score'] as int,
      experienceScore: json['experience score'] as int,
      description: json['description'] as String,
    );
  }

}
