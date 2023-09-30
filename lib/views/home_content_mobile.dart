import 'package:flutter/material.dart';
import 'package:psa_codesprint/widgets/call_to_action.dart';
import 'package:psa_codesprint/widgets/details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Details(),
        SizedBox(height: 100,),
        CallToAction('Applicants'),
        SizedBox(height: 5,),
        CallToAction("Existing Employees")
      ],
    );
  }
}
