// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

class ModeloArticulos {
  ModeloArticulos({
    required this.contenido,
    required this.id,
    required this.idCapitulo,
    required this.nombreArticulo,
  });

  String contenido;
  int id;
  int idCapitulo;
  String nombreArticulo;

  factory ModeloArticulos.fromJson(String str) =>
      ModeloArticulos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModeloArticulos.fromMap(Map<String, dynamic> json) => ModeloArticulos(
        contenido: json["contenido"],
        id: json["id"],
        idCapitulo: json["id_Capitulo"],
        nombreArticulo: json["nombreArticulo"],
      );

  Map<String, dynamic> toMap() => {
        "contenido": contenido,
        "id": id,
        "id_Capitulo": idCapitulo,
        "nombreArticulo": nombreArticulo,
      };
}
