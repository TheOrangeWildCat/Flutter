import 'package:fl_components/models/menu_option.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'Listview1',
        nombre: 'List view tipo 1',
        screen: const Listview1Screen(),
        icon: Icons.auto_awesome_outlined),
    MenuOption(
        route: 'Listview2',
        nombre: 'List view tipo 2',
        screen: const Listview2Screen(),
        icon: Icons.auto_awesome),
    MenuOption(
        route: 'Alert',
        nombre: 'Alertas',
        screen: const AlertScreen(),
        icon: Icons.whatshot_outlined),
    MenuOption(
        route: 'Card',
        nombre: 'Tarjetas',
        screen: const CardScreen(),
        icon: Icons.card_membership_rounded),
    MenuOption(
        route: 'Avatar',
        nombre: 'Circle Avatar',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: 'Animated',
        nombre: 'Animated Container',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_filled_outlined),
    MenuOption(
        route: 'Input',
        nombre: 'Text Input',
        screen: const InputScreen(),
        icon: Icons.input_sharp),
    MenuOption(
        route: 'Slider',
        nombre: 'Slider Screen and chek',
        screen: const SliderScreen(),
        icon: Icons.sledding_outlined),
    MenuOption(
        route: 'listviewbuilder',
        nombre: 'infinite Scroll & pull to refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.swap_vert_circle_outlined)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'Listview1': (BuildContext context) => const Listview1Screen(),
  //   'Listview2': (BuildContext context) => const Listview2Screen(),
  //   'Alert': (BuildContext context) => const AlertScreen(),
  //   'Card': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
