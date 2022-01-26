import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: const [
            CustomCard1(),
            SizedBox(
              height: 10,
            ),
            CustomCard2(
              nombre: 'gatito',
              imageUrl:
                  'https://cosasdemascotas.net/wp-content/uploads/2020/07/n8fonqdqfu4-scaled.jpg',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCard2(
              imageUrl:
                  'https://media.metrolatam.com/2018/01/23/gato-1200x800.jpg',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCard2(
              imageUrl:
                  'https://2.bp.blogspot.com/-F_7qyW7Ivm0/V1enPi9EAnI/AAAAAAAAAuU/QGmyDIuwlVE-QpjLzHF2i7GQmx6eIHgsQCKgB/s1600/chatons-mignons-et-aventureux.jpg',
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
