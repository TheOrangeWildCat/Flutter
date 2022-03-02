import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transito/Provider/providers.dart';
import 'package:transito/models/models.dart';

class ContenidoCpitulos extends StatelessWidget {
  final int indexTitulos;
  final DBProvider capitulos;
  const ContenidoCpitulos({
    Key? key,
    required this.capitulos,
    required this.indexTitulos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: capitulos.getCapitulos(indexTitulos),
      builder: (_, AsyncSnapshot<List<ModeloCapitulos>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<ModeloCapitulos> capitulos = snapshot.data!;
        return Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: capitulos.length,
            itemBuilder: (_, int index) {
              return TextButton(
                  onPressed: () {}, child: Text('${capitulos[index].nombre}'));
            },
          ),
        );
      },
    );
  }
}
