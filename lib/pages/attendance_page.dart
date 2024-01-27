import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttendancePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> personList = [
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : ''
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:10',
        'asistencia' : 'Retraso'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:20',
        'asistencia' : 'Falta'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
      {
        'fecha'  : '11/05/2024',
        'hora'    : '18:00',
        'asistencia' : 'Presente'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greenColor,
        titleTextStyle: TextStyle(
            fontFamily: AppTheme.mediumFont,
            color: Theme.of(context).colorScheme.background,
            fontSize: 25),
        centerTitle: true,
        title: const Text('Marcar Asistencia'),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.background),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.background,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: personList.length,
          itemBuilder: (context, int index) {
            final String asistencia = personList[index]['asistencia'];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.55,
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowTextIcon('calendar-check-02', personList[index]['fecha']),
                            rowTextIcon('clock-check', personList[index]['hora'])
                          ],
                        ),
                      ),
                      Container(
                        child: personList[index]['asistencia'] == '' 
                        ? Expanded(
                          child: CustomButton(
                              text: 'Presente',
                              routeName: () {},
                              paddingv: 10,
                              paddingh: 10,
                              circular: 12,
                              color: Theme.of(context).colorScheme.primary,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontFamily: AppTheme.mediumFont,
                                fontSize: 22,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(personList[index]['asistencia'],
                              style: TextStyle(
                                fontFamily: AppTheme.mediumFont,
                                fontSize: 20,
                                color: asistencia == 'Presente' 
                                ? AppTheme.greenColor
                                : asistencia == 'Retraso' 
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.error,
                              ),
                              textAlign: TextAlign.right,
                            ),
                        )
                      ),
                    ],
                  ),
                ],
                
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) => Divider(color: Theme.of(context).colorScheme.primary, thickness: 0.5, height: 5, indent: 0, endIndent: 0),
        )
      )
    );
  }

  Widget primaryText(String text) {
    return Text(text,
      style: const TextStyle(
        fontFamily: AppTheme.mediumFont,
        fontSize: 25,
        color: AppTheme.primary,
      ));
  }

  Widget rowTextIcon(String icon, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/$icon.svg'
        ),
        const SizedBox(width: 5,),
        
        primaryText(text)
      ],
    );
  }
}