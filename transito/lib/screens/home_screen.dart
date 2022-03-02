import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transito/Provider/providers.dart';

import 'package:transito/routes/routes.dart';

import 'package:transito/screens/screens.dart';
import 'package:transito/widgets/search_card.dart';
import 'package:transito/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOption;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(170, 152, 36, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text('Transito Veracruz'),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

//!
class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //!obtener el selected menuopt
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return SearchCard();
      case 1:
        return ReglamentoScreen();
      case 2:
        return MultasScreen();
      case 3:
        return CalculadoraScreen();
      default:
        return SearchCard();
    }
  }
}
//!


