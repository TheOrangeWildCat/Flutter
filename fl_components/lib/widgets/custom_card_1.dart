import 'package:fl_components/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          leading: Icon(Icons.photo, color: AppTheme.primary),
          title: Text('soy un titulo'),
          subtitle: Text('园社笔类石带具左律。心器馆否普至仍罪曾。'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('cancelar')),
              TextButton(onPressed: () {}, child: const Text('ok'))
            ],
          ),
        )
      ],
    ));
  }
}
