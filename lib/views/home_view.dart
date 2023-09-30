import "package:flutter/material.dart";
import "package:psa_codesprint/widgets/call_to_action.dart";
import "package:psa_codesprint/widgets/centered_view.dart";
import "package:psa_codesprint/widgets/details.dart";
import "package:psa_codesprint/widgets/navigation_bar.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: [
            NavBar(),
            Expanded(child: Row(children: [
              Details(),
              Expanded(child: Center(child: Row(
                children: [
                  CallToAction("Applicants"),
                  SizedBox(width: 10,),
                  CallToAction("Existing Employees")
                ],
              ),))
            ],))
          ],
        ),
      ),
    );
  }
}
