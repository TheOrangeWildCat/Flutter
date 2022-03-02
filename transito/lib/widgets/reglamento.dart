import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:transito/Provider/data_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles(this.tipo);
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<DataProvider>(context);
    final titulos = scanListProvider.titulos;
    return ListView.builder(
        itemCount: titulos.length,
        itemBuilder: (_, i) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
            ),
            child: ExpansionTile(
              title: Text('${titulos[i]}'),
              children: [],
            )));
  }
}
