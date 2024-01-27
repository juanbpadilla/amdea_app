import 'package:amdea_app/pages/pages.dart';
import 'package:amdea_app/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // ignore: prefer_const_constructors
      body: _HomePageBody(),

      bottomNavigationBar: HomeBottomNavigationBar()
    );
  }
}

class _HomePageBody extends StatelessWidget {

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
        return ActivityWidget();
      case 4:
        return ProfilePage();

      default:
        return HomeWidget();
    }
    
  }
}
