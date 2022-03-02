///Esta clase sirve para manejar la información que pertenece a la tabla "Capitulo" en la base de datos.
///los atributos id, y nombre se mapean a los datos que se obtienen en cada consulta a la tabla amtes mencionada.

class ModeloCapitulos {
  int? id;
  String? nombre;

  ModeloCapitulos({
    this.id,
    this.nombre,
  });

  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos
  ///a un objeto de tipo "ModeloCapitulo" para que pueda ser manipulado en el código de la app.
  factory ModeloCapitulos.fromJson(Map<String, dynamic> json) =>
      ModeloCapitulos(
        id: json["id"],
        nombre: json["nombreCapitulo"],
      );
}
