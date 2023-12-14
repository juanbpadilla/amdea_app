import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWitget(
        widget: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          child: _NewWidget(),
        ),
    );
  }
}

class _NewWidget extends StatelessWidget {
  const _NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    String detail = 'Detalle de tarea PEst magna excepteur sit sit deserunt laborum cillum ad esse fugiat excepteur enim reprehenderit ex.';
    String date = '14/02/2023';
    String deadline = '15/02/2023 15:20';

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 90, right: 90, top: 50, bottom: 40),
          child: Image(image: AssetImage('assets/logo.png')),
        ),
        
        Text(
          'ACTIVIDADES',
          style: TextStyle(
            fontFamily: 'Montserrat_bold',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary
          ),
        ),
      
        const SizedBox( height: 40 ),
      
        _ListActivity(title: 'Actividad 1', detail: detail, date: date, deadline: deadline),

        _ListActivity(title: 'Actividad 2', detail: detail, date: date, deadline: deadline),

        _ListActivity(title: 'Actividad 3', detail: detail, date: date, deadline: deadline),
        _ListActivity(title: 'Actividad 3', detail: detail, date: date, deadline: deadline),
        _ListActivity(title: 'Actividad 3', detail: detail, date: date, deadline: deadline),

      ],
    );
  }
}

class _ListActivity extends StatelessWidget {
  const _ListActivity({
    super.key,
    required this.title,
    required this.detail,
    required this.date,
    required this.deadline,
  });

  final String title;
  final String detail;
  final String date;
  final String deadline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                      fontFamily: AppTheme.boldFont,
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.onBackground
                    )),
                    const SizedBox(height: 5),
                    Text(detail, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontFamily: AppTheme.mediumFont,
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onBackground
                    )),
                    const SizedBox(height: 8),
                    Text(date, style: TextStyle(
                      fontFamily: AppTheme.boldFont,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onBackground
                    )),
                  ],
                ),
              ),
    
              CustomButton(
                text: 'Resolver',
                routeName: () => Navigator.pushNamed(context, 'home'),
                color: Theme.of(context).colorScheme.primary,
                textStyle: const TextStyle(
                    color: Colors.white ,
                    fontFamily: 'Montserrat_Medium',
                    fontSize: 18
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('FECHA DE ENTREGA: ', style: TextStyle(
                fontFamily: AppTheme.boldFont,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onBackground
              )),
              Text(deadline, style: TextStyle(
                fontFamily: AppTheme.boldFont,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onBackground
              )),
            ],
          ),
          Divider(color: Theme.of(context).colorScheme.primary, thickness: 1, height: 30, indent: 0, endIndent: 0)
        ],
      ),
    );
  }
}

