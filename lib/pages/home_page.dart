import 'package:amdea_app/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BackgroundWitget(
        widget: _HomePageBody(),
      ),

      bottomNavigationBar: HomeBottomNavigationBar()
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return MultimediaWidget();
      case 1:
        return LibrosWidget();
      case 2:
        return HomeWidget();
      case 3:
        return HomeWidget();
      case 4:
        return HomeWidget();

      default:
        return HomeWidget();
    }
    
  }
}
