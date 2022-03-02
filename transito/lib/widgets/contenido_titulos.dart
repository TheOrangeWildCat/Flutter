import 'package:flutter/material.dart';
import 'package:transito/Provider/providers.dart';
import 'package:transito/models/models.dart';
import 'package:transito/widgets/widgets.dart';

class ContenidoTitulos extends StatelessWidget {
  const ContenidoTitulos({
    Key? key,
    required this.titulos,
    required this.capitulos,
  }) : super(key: key);

  final List<ModeloTitulos> titulos;
  final DBProvider capitulos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titulos.length,
      itemBuilder: (context, indexTitulos) {
        return ExpansionTile(
          title: Text(titulos[indexTitulos].nombreTitulo),
          maintainState: true,
          children: [
            ContenidoCpitulos(capitulos: capitulos, indexTitulos: indexTitulos),
          ],
        );
      },
    );
  }
}
