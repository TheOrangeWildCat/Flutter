import 'package:flutter/material.dart';
import 'package:transito/widgets/widgets.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Color.fromRGBO(202, 184, 124, 1.0),
                height: 400,
                width: double.infinity,
                child: Form(
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 150,
                      ),
                      Text('BUSQUEDA'),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(50),
                          child: CustomInputField(
                            formProperty: 'busqueda',
                            hintText: 'buscar...',
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
