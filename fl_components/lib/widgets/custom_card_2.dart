import 'package:fl_components/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  final String imageUrl;
  final String? nombre;

  const CustomCard2({Key? key, required this.imageUrl, this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        shadowColor: AppTheme.primary.withOpacity(0.50),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(milliseconds: 300),
            ),
            if (nombre != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Text(nombre!))
          ],
        ));
  }
}
