import 'package:amdea_app/providers/ui_provider.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class HomeBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        iconSize: 40,
        selectedItemColor: AppTheme.primary,
        currentIndex: currentIndex,
        elevation: 0,
        items: [
          _bottomNavigationBar(
            currentIndex, 'multimedia.svg', 'Multimedia',
            currentIndex == 0 ? AppTheme.primary : AppTheme.grayColor
          ),

          _bottomNavigationBar(
            currentIndex, 'book.svg', 'Libros',
            currentIndex == 1 ? AppTheme.primary : AppTheme.grayColor
          ),
          
          _bottomNavigationBar(
            currentIndex, 'home.svg', 'Inicio',
            currentIndex == 2 ? AppTheme.primary : AppTheme.grayColor
          ),
          
          _bottomNavigationBar(
            currentIndex, 'activity.svg', 'Actividades',
            currentIndex == 3 ? AppTheme.primary : AppTheme.grayColor
          ),
          
          _bottomNavigationBar(
            currentIndex, 'profile.svg', 'Perfil',
            currentIndex == 4 ? AppTheme.primary : AppTheme.grayColor
          ),
        ]);
  }

  BottomNavigationBarItem _bottomNavigationBar(
      int currentIndex, 
      String icon, 
      String label, 
      Color color
  ) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/$icon',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        label: label);
  }
}
