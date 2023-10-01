import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ApplicantFitScore extends StatelessWidget {
  final int score;

  const ApplicantFitScore(this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage based on the score and a total score of 100.
    double percentage =
        (score / 100).clamp(0.0, 1.0); // Ensure it stays within [0, 1]

    return Container(
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Fit Score",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0
              ),
            ),
            SizedBox(height: 10,),
            CircularPercentIndicator(
              lineWidth: 10,
              percent: percentage,
              radius: 60,
              animation: true,
              animationDuration: 2000,
              backgroundColor: Colors.grey.shade100,
              progressColor: Colors.green,
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$score%",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
