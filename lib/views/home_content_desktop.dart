import 'package:flutter/material.dart';
import 'package:psa_codesprint/routing/route_names.dart';

import '../widgets/call_to_action.dart';
import '../widgets/details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Details(),
      Expanded(child: Center(child: Row(
        children: [
          CallToAction("Applicants", ApplicantsRoute),
          SizedBox(width: 10,),
          CallToAction("Existing Employees", ApplicantsRoute)
        ],
      ),))
    ],);
  }
}
