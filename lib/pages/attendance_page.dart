import 'package:amdea_app/models/attendance.dart';
import 'package:amdea_app/pages/loading_page.dart';
import 'package:amdea_app/providers/attendance_provider.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AttendancePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final listAttendance = Provider.of<AttendanceProvider>(context);
    
    if( listAttendance.isLoading ) return const LoadingPage(color: AppTheme.greenColor,);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greenColor,
        titleTextStyle: TextStyle(
            fontFamily: AppTheme.mediumFont,
            color: Theme.of(context).colorScheme.background,
            fontSize: 25),
        centerTitle: true,
        title: const Text('Marcar Asistencia'),
        // iconTheme:
        //     IconThemeData(color: Theme.of(context).colorScheme.background),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.background,
          ),
          onPressed: () async {
            Navigator.pop(context);
            await listAttendance.showAttendances();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async { 
          await listAttendance.showAttendances();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: height,
            color: Theme.of(context).colorScheme.background,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: listAttendance.attendances.length,
              itemBuilder: (context, int index) {
              
                DateTime fechaActual = DateTime.now();
                Attendance attendance = listAttendance.attendances[index];
                String fecha = '${attendance.lesson.fecha.year.toString()}-${attendance.lesson.fecha.month.toString().padLeft(2, '0')}-${attendance.lesson.fecha.day.toString().padLeft(2, '0')}';
                DateTime horaInicio = DateTime.parse('$fecha ${attendance.lesson.inicio}');
                DateTime horaFin = DateTime.parse('$fecha ${attendance.lesson.fin}');
                final String asistencia = listAttendance.attendances[index].attended > 0 ? 'Presente' : 'Falta';
              
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
                                rowTextIcon('calendar-check-02', fecha),
                                rowTextIcon('clock-check', attendance.lesson.inicio)
                              ],
                            ),
                          ),
                          Container(
                            child: listAttendance.attendances[index].attended < 1 && fechaActual.day == attendance.lesson.fecha.day && fechaActual.hour >= horaInicio.hour && fechaActual.hour <= horaFin.hour
                            ? Expanded(
                              child: CustomButton(
                                  text: 'Marcar',
                                  routeName: () async {
                                    await listAttendance.updateAttended(attendance.id.toString(), 1);
                                  },
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
                              child: Text(asistencia,
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
          ),
        ),
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