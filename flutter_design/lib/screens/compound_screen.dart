import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/background.dart';
import 'package:flutter_design/widgets/card_table.dart';
import 'package:flutter_design/widgets/custtom_botton_navigation_bar.dart';
import 'package:flutter_design/widgets/page_title.dart';

class CompoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background
          Background(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // controller: controller,
      child: Column(
        children: [
//titulos
          PageTitle(),
          //card tale
          CardTable()
        ],
      ),
    );
  }
}
