import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: _HomePageBody(),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar()
   );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final uiProvider = Provider.of<UiProvider>(context);

    // final currentIndex = uiProvider.selectedMenuOpt;

    switch (2) {
      case 0:
        return Card1();

      case 1:
        return Card2();

      case 2:
        return Card3();

      default:
        return Card1();
    }
  }
}
