import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  //
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [Color(0xff2e305f), Color(0xff202333)]));
  //
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // caja morada
      Container(
        decoration: boxDecoration,
      ),
      Positioned(left: -50, top: -100, child: _PinkBox())
      //caja rosa
    ]);
  }
}

class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 35,
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ])),
      ),
    );
  }
}
