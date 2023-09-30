import "package:flutter/material.dart";

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 150,
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavBarItem("Courses"),
              SizedBox(
                width: 60,
              ),
              _NavBarItem("About")
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
