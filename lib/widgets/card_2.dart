import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WallperCard(),
            Text('¡Descubre las herramientas!', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'Crea y transmite una comunicacion visual a travez del diseño grafico publicitario.',
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ],
        ),
      ),
    );
  }
}
