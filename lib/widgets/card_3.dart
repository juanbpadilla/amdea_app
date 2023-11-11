import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WallperCard(),
            Text('¡Aprende!',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
              'Los conceptos basicos sobre la publicidad y metodos de marketing digital en la Ingenieria Comercial.',
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ],
        ),
      ),
    );
  }
}
