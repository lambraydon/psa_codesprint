import 'package:flutter/material.dart';
import 'package:psa_codesprint/widgets/CourseTile.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 2,
      children: const [
        CourseTile(coursename: "Intro to Python", imagepath: "assets/pythonpng.jpg"),
        CourseTile(coursename: "Basics of ML", imagepath: "assets/MLpng.png"),
        CourseTile(coursename: "Data Visualisation with MatPlotLib", imagepath: "assets/matplotlibpng.png"),
        CourseTile(coursename: "Leadership & Communication", imagepath: "assets/leadershippng.png"),
        CourseTile(coursename: "Port Operation and Management", imagepath: "assets/portpng.png"),
        CourseTile(coursename: "Data Visualisation with R", imagepath: "assets/Rpng.jpg"),
        CourseTile(coursename: "Workplace Safety", imagepath: "assets/safetypng.jpg"),
        CourseTile(coursename: "Logistics Management", imagepath: "assets/warehouse png.png"),
        CourseTile(coursename: "Programming with Java", imagepath: "assets/javapng.png"),

      ],
    );
  }
}
