import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsServices>(context);

    if (productsServices.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsServices.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            //para romper la referenciay no afectar al producto original
            productsServices.selectedProduct =
                productsServices.products[index].copy();
            //para romper la referenciay no afectar al producto original
            Navigator.pushNamed(context, 'products');
          },
          child: ProductsCard(
            products: productsServices.products[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsServices.selectedProduct = Products(
            available: true,
            name: '',
            price: 0.0,
          );
          Navigator.pushNamed(context, 'products');
        },
      ),
    );
  }
}
