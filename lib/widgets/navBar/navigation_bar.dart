import "package:flutter/material.dart";
import 'package:psa_codesprint/widgets/navBar/navigation_bar_desktop.dart';
import 'package:psa_codesprint/widgets/navBar/navigation_bar_mobile.dart';
import "package:responsive_builder/responsive_builder.dart";

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const NavigationBarMobile(),
      desktop: (BuildContext context) => const NavigationBarDesktop(),
    );
  }
}

