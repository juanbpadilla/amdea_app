import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
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
            CustomButton(
              text: 'Marcar Asistencia',
              icon: 'check-square.svg',
              routeName: () => Navigator.pushNamed(context, 'home'),
              color: const Color(0xFF289618),
              textStyle: const TextStyle(
                  color: Colors.white ,
                  fontFamily: 'Montserrat_Medium',
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            ),
    
            const SizedBox( height: 20 ),
    
            const _CardActivity(
              text1: 'ACTIVIDAD 1',
              text2: 'Detalle de tarea',
              text3: '15/02/2023 15:20',
            ),
    
            const SizedBox( height: 15 ),
    
            const _CardActivity(
              text1: 'ACTIVIDAD 2',
              text2: 'Detalle de tarea Exercitation enim nisi enim nulla exercitation ipsum quis velit ipsum incididunt quis',
              text3: '16/02/2023 15:20',
            )
          ],
        ),
      ),
    );
  }
}

class _CardActivity extends StatelessWidget {
  
    final String text1;
    final String text2;
    final String text3;

  const _CardActivity({
    required this.text1, 
    required this.text2, 
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 25 ),
        color: AppTheme.primary,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/file-plus.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 68,
                ),

                const SizedBox( width: 15, ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                
                      const SizedBox( height: 3 ),
                      
                      Text(
                        text2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        // maxLines: 2,
                      ),
                      
                      const SizedBox( height: 18 ),
                  
                      Row(
                        children: [
                          const _TextContent(text: 'ENTREGA: '),
                  
                          // const SizedBox( width: 3 ),
                          _TextContent(text: text3),
                        ],
                      ),
                      const SizedBox( height: 5 ),
                    ],
                  ),
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
  final String text;
  const _TextContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'Monserrat',
        fontWeight: FontWeight.w700,
        height: 0.16,
      ),
    );
  }
}