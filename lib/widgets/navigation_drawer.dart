import 'package:flutter/material.dart';
import 'package:psa_codesprint/routing/route_names.dart';
import 'package:psa_codesprint/widgets/drawer_items.dart';
import 'package:psa_codesprint/widgets/navigation_drawer_header.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]
      ),
      child: const Column(
        children: [
          NavigationDrawerHeader(),
          DrawerItem("Courses", Icons.library_books, CoursesRoute),
          DrawerItem("About", Icons.help, AboutRoute)
        ],
      ),
    );
  }
}
