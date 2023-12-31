import "package:flutter/material.dart";
import "package:psa_codesprint/views/home_content_desktop.dart";
import "package:psa_codesprint/views/home_content_mobile.dart";
import "package:responsive_builder/responsive_builder.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeContentMobile(),
      desktop: (BuildContext context) => const HomeContentDesktop(),
    );
  }
}
