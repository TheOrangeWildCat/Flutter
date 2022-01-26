import 'package:fl_components/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('slider & check')),
      body: Column(
        children: [
          Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              inactiveColor: Colors.orange[200],

              //* divisions: 10,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (value) {
                      print(value);
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null),
          Checkbox(
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value ?? true;
                  })),
          CheckboxListTile(
            title: const Text('habilitar slider'),
            value: _sliderEnabled,
            activeColor: AppTheme.primary,
            onChanged: (value) => setState(() {
              _sliderEnabled = value ?? true;
            }),
          ),
          Switch(
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value;
                  })),
          SwitchListTile.adaptive(
              activeColor: AppTheme.primary,
              title: const Text('habilitar slider'),
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value;
                  })),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://www.pngmart.com/files/21/2D-Tree-PNG-HD.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
