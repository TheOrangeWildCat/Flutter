import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/screens/scroll_screen.dart';
import 'package:flutter_design/screens/compound_screen.dart';
import 'package:flutter_design/screens/basic_design.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: const _TempHomeScreen(),
      initialRoute: 'compound_screen',
      routes: {
        'basic_design': (_) => BasicDesignScreen(),
        'scroll_screen': (_) => ScrollScreen(),
        'compound_screen': (_) => CompoundScreen()
      },
    );
  }
}

class _TempHomeScreen extends StatelessWidget {
  const _TempHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('hola mundo'), Text('hola mundo')],
    );
  }
}
