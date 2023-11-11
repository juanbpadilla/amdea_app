import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: Column(
        children: [
          const _NavigationItems(),
    
          Center(
            child: Row(
              children: [
          
                Expanded(child: CustomButton(
                  text: 'Iniciar Sesión',
                  color: AppTheme.primary,
                )),
                
                Expanded(child: CustomButton(
                  text: 'Salir',
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
  const _NavigationItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( left: 90, right: 90, bottom: 30 ),
    
      child: BottomNavigationBar(
        elevation: 0,
        items: [
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: const ColorFilter.mode(Color(0xFFA6A6A6), BlendMode.srcIn),
            ),
            label: ''
          ),
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: const ColorFilter.mode(Color(0xFFA6A6A6), BlendMode.srcIn),
            ),
            label: ''
          ),
      
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rectangle.svg',
              colorFilter: const ColorFilter.mode(Color(0xFFA6A6A6), BlendMode.srcIn),
            ),
            label: ''
          ),
      
        ],
      ),
    );
  }
}