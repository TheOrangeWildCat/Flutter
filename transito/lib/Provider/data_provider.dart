import 'package:flutter/material.dart';
import 'package:transito/Provider/providers.dart';
import 'package:transito/models/models.dart';

class DataProvider extends ChangeNotifier {
  List<ModeloTitulos> titulos = [];
  DataProvider() {
    cargarTitulos();
  }

  cargarTitulos() async {
    final titulos = await DBProvider.db.getTitulos();
    this.titulos = [...titulos];
    notifyListeners();
  }
}
