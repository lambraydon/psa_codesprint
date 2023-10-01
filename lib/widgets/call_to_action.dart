import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/navigation_service.dart';

class CallToAction extends StatelessWidget {
  final String title;
  final String navigatePath;
  const CallToAction(this.title, this.navigatePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigatePath);
      },
      child: Container(
        width: 300,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 31, 229, 146),
        borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
