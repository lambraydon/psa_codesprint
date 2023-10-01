import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../widgets/CourseTile.dart';

class RecommendedCourses extends StatelessWidget {

  const RecommendedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CourseTile(coursename: "Leadership", imagepath: "assets/leadershippng.png"),
          ],
        ),
      ),
    );
  }
}
