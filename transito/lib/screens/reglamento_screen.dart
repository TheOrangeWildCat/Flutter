import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transito/Provider/providers.dart';
import 'package:transito/widgets/widgets.dart';

class ReglamentoScreen extends StatelessWidget {
  const ReglamentoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<DataProvider>(context);
    final titulos = scanListProvider.titulos;
    final capitulos = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
        body: ContenidoTitulos(titulos: titulos, capitulos: capitulos));
  }
}
