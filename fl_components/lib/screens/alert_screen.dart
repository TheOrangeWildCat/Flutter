import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIos(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context, //
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('esta es el mensaje'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 50,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aceptar',
                      style: TextStyle(color: Colors.blue)))
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context, //
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            elevation: 5,
            title: const Text('Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('esta es el mensaje'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 50,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aceptar',
                      style: TextStyle(color: Colors.blue)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              'AlertScreen',
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () => Platform.isAndroid
              ? displayDialogAndroid(context)
              : displayDialogIos(context), //
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context); //
        },
      ),
    );
  }
}
