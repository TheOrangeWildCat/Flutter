import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {
  final String _baseURL = 'flutter-ca2e1-default-rtdb.firebaseio.com';
  final List<Products> products = []; // final no destruye el objeto
  //late Product selectedProduct; para cargar productos
  Products? selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

  //* hacer fetch de productos.

  ProductsServices() {
    loadProducts();
  }
  //<List<Products>>
  Future<List<Products>> loadProducts() async {
    isLoading = true; // si ya esta en tru no redibuja el widget
    notifyListeners();

    final url = Uri.https(_baseURL, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> producstMap = json.decode(resp.body);

    producstMap.forEach((key, value) {
      final tempProduct = Products.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    // print(products[0].name);
    return products;
  }

  Future saveOrCreateProduct(Products product) async {
    isSaving = true;
    notifyListeners();
// aqui no me servia porque puse solo product en lugar de product id
    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Products product) async {
    final url = Uri.https(_baseURL, '/products/${product.id}.json');
    // cerificar que aqui es put y no get
    final resp = await http.put(url, body: product.toJson());
    final decoded = resp.body;
    print(decoded);

    //* actualizar la lista de productos
    final indice =
        products.lastIndexWhere((element) => element.id == product.id);
    products[indice] = product;

    return (product.id!);
  }

  Future<String> createProduct(Products product) async {
    final url = Uri.https(_baseURL, 'products.json');
    // cerificar que aqui es put y no get
    final resp = await http.post(url, body: product.toJson());
    final decoded = json.decode(resp.body);
    // print(decoded);

    product.id = decoded['name'];
    //me manda error porque le puse () en vez de []

    // products.add(product)
    notifyListeners();
    return product.id!;
  }
}
