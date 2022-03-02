// To parse this JSON data, do
//
//     final modeloTitulos = modeloTitulosFromMap(jsonString);

import 'dart:convert';

class ModeloTitulos {
  ModeloTitulos({
    this.id,
    required this.nombreTitulo,
  });

  int? id;
  String nombreTitulo;

  factory ModeloTitulos.fromJson(Map<String, dynamic> json) => ModeloTitulos(
        id: json["id"],
        nombreTitulo: json["nombreTitulo"],
      );
}
