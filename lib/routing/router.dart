import 'package:flutter/material.dart';
import 'package:psa_codesprint/routing/route_names.dart';
import 'package:psa_codesprint/views/applicants_view/applicants_view.dart';
import 'package:psa_codesprint/views/home_view.dart';

import '../views/about_view.dart';
import '../views/courses_view.dart';
import '../views/employees_view/employees_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeView());
    case AboutRoute:
      return _getPageRoute(const AboutView());
    case CoursesRoute:
      return _getPageRoute(const CoursesView());
    case ApplicantsRoute:
      return _getPageRoute(const ApplicantsView());
    case EmployeesRoute:
      return _getPageRoute(const EmployeesView());
    default:
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

