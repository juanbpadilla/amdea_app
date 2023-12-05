import 'package:amdea_app/theme/app_theme.dart';
// import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LibrosWidget extends StatelessWidget {
  const LibrosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric( horizontal: 30),
      child: const Column(
        children: [
          Text(
            'BIBLIOGRAFÍA',
            style: TextStyle(
              fontFamily: 'Montserrat_bold',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppTheme.primary
            ),
          ),

          SizedBox( height: 20 ),

          Row(
            children: [
              _CardActivity(
                text1: 'CURSO DE TEORÍA',
              ),

              SizedBox( width: 15 ),

              _CardActivity(
                text1: 'CURSO DE PHOTOSHOP',
              ),
            ],
          ),
          SizedBox( height: 15 ),
          Row(
            children: [
              _CardActivity(
                text1: 'CURSO DE TEORÍA',
              ),

              SizedBox( width: 15 ),

              _CardActivity(
                text1: 'CURSO DE PHOTOSHOP',
              ),
            ],
          ),
          SizedBox( height: 15 ),
          Row(
            children: [
              _CardActivity(
                text1: 'CURSO DE TEORÍA',
              ),

              SizedBox( width: 15 ),

              _CardActivity(
                text1: 'CURSO DE PHOTOSHOP',
              ),
            ],
          ),

        ],
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
        padding: const EdgeInsets.symmetric( vertical: 20),
        width: 165,
        color: AppTheme.primary,
        child: _TextContent(contenText: text1),
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
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}