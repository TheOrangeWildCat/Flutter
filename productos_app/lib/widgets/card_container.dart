import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        // height: 300, //TODO borrar
        decoration: _CreateCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _CreateCardShape() => BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10, //
            offset: Offset(0, 5))
      ], color: Colors.white, borderRadius: BorderRadius.circular(30));
}
