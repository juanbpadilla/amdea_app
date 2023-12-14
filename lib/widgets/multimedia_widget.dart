import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'background_widget.dart';

class MultimediaWidget extends StatelessWidget {
  const MultimediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundWitget(
        widget: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric( horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
              child: Image(image: AssetImage('assets/logo.png')),
            ),

            SizedBox( height: 10 ),
              
            const Text(
              'RECURSOS MULTIMEDIA',
              style: TextStyle(
                fontFamily: 'Montserrat_bold',
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppTheme.primary
              ),
            ),
    
            const SizedBox( height: 40 ),
    
            _CardActivity(
              text1: 'CURSO DE TEORÍA',
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.background,
              iconText: 'fold_21',
            ),
    
            const SizedBox( height: 15 ),
    
            const _CardActivity(
              text1: 'CURSO DE PHOTOSHOP',
              color: Color(0xFF001E36),
              textColor: Color(0xFF30A8FF),
              iconText: 'ps_icon',
            ),
    
            const SizedBox( height: 15 ),
    
            const _CardActivity(
              text1: 'CURSO DE ILUSTRATOR',
              color: Color(0xFF330000),
              textColor: Color(0xFFF89400),
              iconText: 'Illustrator',
            )
          ],
        ),
      ),
    );
  }
}

class _CardActivity extends StatelessWidget {
  
    final String text1;
    final Color color;
    final Color textColor;
    final String iconText;

  const _CardActivity({
    super.key, 
    required this.text1, 
    required this.color, 
    required this.textColor, required this.iconText,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        // height: 400,
        padding: const EdgeInsets.symmetric( vertical: 20, horizontal: 20 ),
        width: double.infinity,
        color: color,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$iconText.svg',
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
              height: 30,
            ),
            const SizedBox(width: 5,),
            Text(
              text1,
              style: TextStyle(
                color: textColor,
                fontFamily: AppTheme.boldFont,
                fontSize: 18
              ),
            ),
          ],
        )

      ),
    );
  }
}