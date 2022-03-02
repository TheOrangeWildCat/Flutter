import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transito/Provider/providers.dart';
import 'package:transito/routes/routes.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOption;
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(122, 111, 38, 1),
          icon: Icon(
            Icons.search,
          ),
          activeIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(169, 152, 32, 1),
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              menuOptions[0].icon,
            ),
            activeIcon: Icon(
              menuOptions[0].icon,
              color: Color.fromRGBO(169, 152, 32, 1),
            ),
            label: menuOptions[0].nombre),
        BottomNavigationBarItem(
            icon: Icon(
              menuOptions[1].icon,
            ),
            activeIcon: Icon(
              menuOptions[1].icon,
              color: Color.fromRGBO(169, 152, 32, 1),
            ),
            label: menuOptions[1].nombre),
        BottomNavigationBarItem(
            icon: Icon(
              menuOptions[2].icon,
            ),
            activeIcon: Icon(
              menuOptions[2].icon,
              color: Color.fromRGBO(169, 152, 32, 1),
            ),
            label: menuOptions[2].nombre),
      ],
    );
  }
}
