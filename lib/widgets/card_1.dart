import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WallperCard(),

          const SizedBox( height: 10 ),
          
          Text(
            'Bienvenido',
            style: Theme.of(context).textTheme.titleLarge
          ),

          const SizedBox( height: 10 ),

          Text(
            'En esta aplicacion aprenderas todo los conceptos basicos sobre publicidad.',
            style: Theme.of(context).textTheme.bodyMedium
          ),
        ],
      ),
    );
  }
}