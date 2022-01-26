import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Angel ',
      'last_name': 'Acuña ',
      'email': 'angel@gmail.com ',
      'password': '123456 ',
      'role': 'Admin '
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  helperText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  helperText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Correo',
                  helperText: 'ejemplo@gmail.com',
                  hintText: 'ejemplo@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña',
                  obscureText: true,
                  counterText: 'se requieren almenos 8 caracteres',
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                //*
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: ('Admin'), child: Text('Admin')),
                      DropdownMenuItem(
                          value: ('SuperUser'), child: Text('SuperUser')),
                      DropdownMenuItem(
                          value: ('Developer'), child: Text('Developer')),
                      DropdownMenuItem(
                          value: ('Developer JR'), child: Text('Developer JR'))
                    ],
                    onChanged: (value) {
                      print(value);
                      formValues['Role'] = value ?? 'Admin';
                    }),
                ElevatedButton(
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Guardar'))),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(
                          FocusNode()); //! esto sirve para minimizar el teclado cuando se presiona el boton
                      if (!myFormKey.currentState!.validate()) {
                        print('formulario no valido');
                      }
                      print(formValues);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
