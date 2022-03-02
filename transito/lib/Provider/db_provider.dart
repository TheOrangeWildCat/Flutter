import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transito/models/models.dart';

class DBProvider extends ChangeNotifier {
  static Database? _database;
  static final DBProvider db =
      DBProvider._(); // instancia de la clase personalizada
  DBProvider._();
  DBProvider() {}

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    final localpath = await getDatabasesPath();
    final path = join(localpath, "reglamento.db");
    final createdDB = await databaseExists(path);

//! Este método verifica que la base de datos exista en el dispositivo, si no existe copia el archivo de la carpeta
//!assets para crearla localmente y despues abrirla. Si la base de datos ya existe, simplemente la abre.

    if (!createdDB) {
      print('DB no encontrada, \n importndo DB...');
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "reglamento.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    }
    print('DB Cargada con Exito');

//!
    return await openDatabase(path, readOnly: true);
  }

  Future<List<ModeloTitulos>> getTitulos() async {
    final db = await database;
    final res = await db!.query('Titulo');

    print(res);
    return res.isNotEmpty
        ? res.map((s) => ModeloTitulos.fromJson(s)).toList()
        : [];
  }

  Future<List<ModeloCapitulos>> getCapitulos(int idTitulo) async {
    final db = await database;
    final capitulos = await db?.query('Capitulo',
        columns: ['id', 'nombreCapitulo'],
        where: 'id_Titulo = ?',
        whereArgs: [idTitulo]);

    List<ModeloCapitulos> listaCapitulos = capitulos!.isNotEmpty
        ? capitulos.map((e) => ModeloCapitulos.fromJson(e)).toList()
        : [];
    return listaCapitulos;
  }
}
