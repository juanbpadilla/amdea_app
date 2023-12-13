import 'package:amdea_app/theme/app_theme.dart';
// import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
        child: const Column(
          children: [
            Text(
              'RECURSOS MULTIMEDIA',
              style: TextStyle(
                fontFamily: 'Montserrat_bold',
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppTheme.primary
              ),
            ),
    
            SizedBox( height: 20 ),
    
            _CardActivity(
              text1: 'CURSO DE TEORÍA',
            ),
    
            SizedBox( height: 15 ),
    
            _CardActivity(
              text1: 'CURSO DE PHOTOSHOP',
            ),
    
            SizedBox( height: 15 ),
    
            _CardActivity(
              text1: 'CURSO DE ILUSTRATOR',
            )
          ],
        ),
      ),
    );
  }
}

class _CardActivity extends StatelessWidget {
  
    final String text1;

  const _CardActivity({
    super.key, 
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // height: 400,
        padding: const EdgeInsets.symmetric( vertical: 40, horizontal: 20 ),
        width: double.infinity,
        color: AppTheme.primary,
        child: _TextContent(contenText: text1)

      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  final String contenText;
  const _TextContent({super.key, required this.contenText});

  @override
  Widget build(BuildContext context) {
    return Text(contenText,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}