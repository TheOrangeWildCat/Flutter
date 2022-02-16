import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            //
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(), child: _LoginForm())
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text('crear una nueva cuenta'),
            const SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
        child: Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // TODO mantener la referencia key

      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'eg@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = new RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'verifique su correo';
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'contraseña',
                  prefixIcon: Icons.lock_open_rounded),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                //! puede usarse el if o un ternario
                // if (value != null && value.length >= 6) return null;
                // return 'la contraseña debe ser de 6 caracteres';
                return (value != null && value.length >= 6)
                    ? null
                    : 'la contraseña debe ser de 6 caracteres';
              }),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Cargando' : 'ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () async {
                //TODO
                FocusScope.of(context).unfocus(); // para ocultar el teclado
                if (!loginForm.isValidForm()) return;

                loginForm.isLoading =
                    true; //si validamos el formulario y es true cambia el valor
                await Future.delayed(Duration(seconds: 3));
                loginForm.isLoading = false;

                Navigator.pushReplacementNamed(context,
                    'home'); // si el programa es valido se mandara a llamar una peticion HTML
              })
        ],
      ),
    ));
  }
}
