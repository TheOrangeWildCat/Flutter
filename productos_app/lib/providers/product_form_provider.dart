import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  // manejo el global key para saber el estado del fotm
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Products product;
// me tienen que mandar una coia de un producto seleccionado
  ProductFormProvider(this.product);
  updateAvailability(bool value) {
    print(value);
    product.available = value;
    notifyListeners();
  }

  bool isValidate() {
    print(product.name);
    print(product.price);
    print(product.available);

    return formKey.currentState?.validate() ?? false;
  }
}
