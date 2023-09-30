import 'package:flutter/material.dart';
import 'package:psa_codesprint/routing/route_names.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavBarItem("Courses", CoursesRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem("About", AboutRoute)
            ],
          )
        ],
      ),
    );
  }
}
