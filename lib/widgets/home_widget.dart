import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric( horizontal: 30),
      child: Column(
        children: [
          CustomButton(
            text: 'ASISTENCIA',
            routeName: () => Navigator.pushNamed(context, 'home'),
            color: const Color(0xFF289618),
            textStyle: const TextStyle(
                color: Colors.white ,
                fontFamily: 'Montserrat_Medium',
                fontSize: 30,
                fontWeight: FontWeight.w500
            ),
          ),

          const SizedBox( height: 20 ),

          const _CardActivity(
            text1: 'ACTIVIDAD 1',
            text2: 'DETALLE',
            text3: 'FECHA ENTREGA',
          ),

          const SizedBox( height: 15 ),

          const _CardActivity(
            text1: 'ACTIVIDAD 2',
            text2: 'DETALLE',
            text3: 'FECHA ENTREGA',
          )
        ],
      ),
    );
  }
}

class _CardActivity extends StatelessWidget {
  
    final String text1;
    final String text2;
    final String text3;

  const _CardActivity({
    super.key, 
    required this.text1, 
    required this.text2, 
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // height: 400,
        padding: const EdgeInsets.symmetric( vertical: 15, horizontal: 20 ),
        width: double.infinity,
        color: AppTheme.primary,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
                child: _TextContent(contenText: text1)
            ),

            const SizedBox( height: 10 ),

            Row(
              children: [
                const SizedBox( width: 98, ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TextContent(contenText: text2),

                    const SizedBox( height: 10 ),

                    _TextContent(contenText: text3),
                  ],
                )
              ],
            )
          ],
        ),
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
      textAlign: TextAlign.left,
    );
  }
}