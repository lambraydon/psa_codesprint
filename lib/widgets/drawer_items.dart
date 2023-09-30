import 'package:flutter/material.dart';
import 'package:psa_codesprint/widgets/navBar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const DrawerItem(this.title, this.icon, this.navigationPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 60),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 30,),
          NavBarItem(title, navigationPath),
        ],
      ),);
  }
}
