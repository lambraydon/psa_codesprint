import 'package:flutter/material.dart';
import 'package:psa_codesprint/locator.dart';
import 'package:psa_codesprint/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigatePath;
  const NavBarItem(this.title, this.navigatePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigatePath);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}