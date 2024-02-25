import 'dart:developer';

import 'package:amdea_app/sercices/topic_service.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'background_widget.dart';

class MultimediaWidget extends StatelessWidget {
  const MultimediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final topicService = Provider.of<TopicService>(context);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BackgroundWitget(
        widget: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric( horizontal: height * 0.036),
        child: Column(
          children: [
            const SizedBox( height: 50 ),

            Image(image: const AssetImage('assets/logo.png'), width: width * 0.55),

            const SizedBox( height: 50 ),
              
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
    
            _cardActivity(
              text1: 'CURSO DE TEORÍA',
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.background,
              iconText: 'fold_21',
              onTap: () => Navigator.pushNamed(context, 'multimedia/video/conceptos'),
            ),
    
            const SizedBox( height: 15 ),
    
            _cardActivity(
              text1: 'CURSO DE PHOTOSHOP',
              color: const Color(0xFF001E36),
              textColor: const Color(0xFF30A8FF),
              iconText: 'ps_icon',
              onTap: () =>
                  Navigator.pushNamed(context, 'multimedia/video/photoshop'),
            ),
    
            const SizedBox( height: 15 ),
    
            _cardActivity(
              text1: 'CURSO DE ILUSTRATOR',
              color: const Color(0xFF330000),
              textColor: const Color(0xFFF89400),
              iconText: 'Illustrator',
              onTap: () async {
                  // Navigator.pushNamed(context, 'multimedia/video/illustrator'),
                final topics = await topicService.showtopics();
                log('logintud: ${topics?.length}');
                log('logintud service: ${topicService.topics.length}');
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _cardActivity({
    required String text1,
    required Color color,
    required Color textColor,
    required String iconText,
    Function()? onTap
  }) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextButton(
        onPressed: onTap,
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
      ),
    );
  }
}