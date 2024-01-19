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

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BackgroundWitget(
        widget: Container(
        width: width,
        padding: EdgeInsets.symmetric( horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox( height: 50 ),

            Image(image: AssetImage('assets/logo.png'), width: width * 0.55),

            const SizedBox( height: 50 ),
              
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.065),
              child: CustomButton(
                text: 'Marcar Asistencia',
                icon: 'check-square.svg',
                routeName: () => Navigator.pushNamed(context, 'home'),
                color: const Color(0xFF289618),
                paddingv: height * 0.012,
                paddingh: 2,
                textStyle: const TextStyle(
                    color: Colors.white ,
                    fontFamily: 'Montserrat_Medium',
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
    
            SizedBox( height: height * 0.025 ), //  Tamaño 20 relativo
    
            const _CardActivity(
              text1: 'ACTIVIDAD 1',
              text2: 'Detalle de tarea',
              text3: '15/02/2023 15:20',
            ),
    
            SizedBox( height: height * 0.019 ), //  Tamaño 15 relativo
    
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

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric( vertical: height * 0.011, horizontal: width * 0.025 ),
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
                  width: MediaQuery.of(context).size.width * 0.5,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        // ((height * 0.036).toInt()).toString(),
                        // ((width * 0.025).toInt()).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.028, //  Tamaño 23 relativo
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                
                      // SizedBox( height: height * 0.004 ), //  Tamaño 3 relativo
                      
                      Text(
                        text2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.021, //  Tamaño 17 relativo
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        // maxLines: 2,
                      ),
                      
                      const SizedBox( height: 15 ),
                  
                      Row(
                        children: [
                          const _TextContent(text: 'ENTREGA: '),
                  
                          // const SizedBox( width: 3 ),
                          _TextContent(text: text3),
                        ],
                      ),
                      SizedBox( height: height * 0.01 ), //  Tamaño 8 relativo
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