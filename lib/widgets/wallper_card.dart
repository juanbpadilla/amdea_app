import 'package:flutter/material.dart';

class WallperCard extends StatelessWidget {
  const WallperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'), 
        image: NetworkImage('https://fakeimg.pl/150x300/2c2f88/2c2f88'),
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}