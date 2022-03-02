import 'package:transito/models/models.dart';
import 'package:transito/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOption = <MenuOption>[
    MenuOption(
      route: 'reglamento',
      nombre: 'Reglamento',
      screen: const ReglamentoScreen(),
      icon: Icons.menu_book_rounded,
    ),
    MenuOption(
      route: 'multas',
      nombre: 'Multas',
      screen: const MultasScreen(),
      icon: Icons.attach_money_rounded,
    ),
    MenuOption(
      route: 'calculadora',
      nombre: 'Calculadora',
      screen: const CalculadoraScreen(),
      icon: Icons.calculate,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }
}
