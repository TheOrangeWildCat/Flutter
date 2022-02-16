import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //porque lo voy a mostrar dentro del formulario
  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading =>
      _isLoading; //para cuando yo quiera hacer el set de la informacion

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$email - $password');
    return formKey.currentState?.validate() ??
        false; //las validaciones se muestran ya en pantalla
  }
}
