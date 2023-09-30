import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SizedBox(
        height: 80,
        width: 150,
        child: Image(
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
