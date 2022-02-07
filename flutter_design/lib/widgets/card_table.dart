import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            text: 'General',
            icon: Icons.pie_chart_outline_rounded,
          ),
          _SingleCard(
            color: Colors.deepPurple,
            text: 'Transport',
            icon: Icons.train_sharp,
          )
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.pink,
            text: 'Shopping',
            icon: Icons.shopping_bag_outlined,
          ),
          _SingleCard(color: Colors.orange, text: 'Bills', icon: Icons.money)
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.indigo,
            text: 'Entreteinment',
            icon: Icons.movie_filter_outlined,
          ),
          _SingleCard(
            color: Colors.green,
            text: 'Grocery',
            icon: Icons.local_grocery_store_outlined,
          )
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.indigo,
            text: 'Entreteinment',
            icon: Icons.movie_filter_outlined,
          ),
          _SingleCard(
            color: Colors.green,
            text: 'Grocery',
            icon: Icons.local_grocery_store_outlined,
          )
        ])
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            radius: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            this.text,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            // margin: EdgeInsets.all(10),
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
