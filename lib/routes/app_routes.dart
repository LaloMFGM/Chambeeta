import 'package:chambeeta/models/menu_option.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'login',
        name: 'login',
        icon: Icons.login_outlined,
        screen: const Login()),
    MenuOption(
        route: 'signIn',
        name: 'signIn',
        icon: Icons.login_outlined,
        screen: const SignIn()),
    MenuOption(
        route: 'dashboard_menu',
        name: 'dashboard_menu',
        icon: Icons.login_outlined,
        screen: const DashboardMenu()),
    // MenuOption(
    //     route: 'home',
    //     name: 'home',
    //     icon: Icons.login_outlined,
    //     screen: const HomePage()),
    // MenuOption(
    //     route: 'create_task',
    //     name: 'create_task',
    //     icon: Icons.login_outlined,
    //     screen: const CreateTask()),
    // MenuOption(
    //     route: 'create_icc',
    //     name: 'create_icc',
    //     icon: Icons.home_work_outlined,
    //     screen: const CreateICCPage()),
    // MenuOption(
    //     route: 'create_icp',
    //     name: 'create_icp',
    //     icon: Icons.home_work_outlined,
    //     screen: const CreateICPPage()),
    // MenuOption(
    //     route: 'create_icm',
    //     name: 'create_icm',
    //     icon: Icons.home_work_outlined,
    //     screen: const CreateICMPage()),
    // MenuOption(
    //   route: 'sap_form',
    //   name: 'sap_form',
    //   icon: Icons.login_outlined,
    //   screen: const SAPFormPage()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final options in menuOptions) {
      appRoutes
          .addAll({options.route: (BuildContext context) => options.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const Login());
  }
}
