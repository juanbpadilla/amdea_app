import 'dart:io';

import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {

  final int currentPage;
  final Function(int) navigateToPage;

  const CustomNavigationBar({super.key, required this.currentPage, required this.navigateToPage});


  @override
  Widget build(BuildContext context) {

    void NavigateTo() => Navigator.pushNamed(context, 'login');
    void _Exit() => exit(0);

    return Container(
      height: 150,
      alignment: Alignment.center,
      child: Column(
        children: [
          _NavigationItems(currentPage: currentPage, navigateToPage: navigateToPage),
    
          Center(
            child: Row(
              children: [
          
                Expanded(child: CustomButton(
                  text: 'Iniciar Sesión',
                  routeName: NavigateTo,
                  color: AppTheme.primary,
                )),
                
                Expanded(child: CustomButton(
                  text: 'Salir',
                  routeName: _Exit,
                  color: AppTheme.secondary,
          
                ))
          
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NavigationItems extends StatelessWidget {

  final int currentPage;
  final Function(int) navigateToPage;

  const _NavigationItems({
    required this.currentPage, 
    required this.navigateToPage
  });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only( left: 90, right: 90, bottom: 0 ),
    
      child: BottomNavigationBar(
        onTap: (int i) => navigateToPage(i),
        currentIndex: currentPage,
        elevation: 0,
        items: [
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: currentPage == 0 
                ? const ColorFilter.mode(AppTheme.primary, BlendMode.srcIn)
                : const ColorFilter.mode(AppTheme.secondary, BlendMode.srcIn),
            ),
            label: ''
          ),
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: currentPage == 1 
                ? const ColorFilter.mode(AppTheme.primary, BlendMode.srcIn)
                : const ColorFilter.mode(AppTheme.secondary, BlendMode.srcIn),
            ),
            label: ''
          ),
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: currentPage == 2 
                ? const ColorFilter.mode(AppTheme.primary, BlendMode.srcIn)
                : const ColorFilter.mode(AppTheme.secondary, BlendMode.srcIn),
            ),
            label: ''
          ),
      
        ],
      ),
    );
  }
}