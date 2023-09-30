import 'package:flutter/material.dart';
import 'package:psa_codesprint/locator.dart';
import 'package:psa_codesprint/routing/route_names.dart';
import 'package:psa_codesprint/routing/router.dart';
import 'package:psa_codesprint/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/centered_view.dart';
import '../../widgets/navBar/navigation_bar.dart';
import '../../widgets/navigation_drawer.dart';


class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? const NavDrawer() : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: [
              const NavBar(),
              Expanded(child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
