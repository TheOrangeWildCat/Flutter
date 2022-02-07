import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff77E9C4), Color(0xff4dd0e1)],
        stops: [0.5, 0.5]),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: boxDecoration,
      child: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Page1(),
            Page2(),
          ]),
    ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Background(), MainContent()],
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan[300],
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue[500], shape: StadiumBorder()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            onPressed: () {},
          ),
        ));
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '11°',
              style: textStyle,
            ),
          ),
          Text(
            'Miércoles',
            style: textStyle,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
          )),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.cyan[300],
        height: double.infinity,
        child: Image(image: AssetImage('assets/scroll-1.png')));
  }
}
