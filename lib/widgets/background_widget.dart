import 'package:flutter/material.dart';

class BackgroundWitget extends StatelessWidget {
  final Widget widget;

  const BackgroundWitget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const SizedBox( height: 50, ),

          const SizedBox(
            width: 220,
            child: Image(image: AssetImage('assets/logo.png'))
          ),

          const SizedBox( height: 70 ),

          widget
        ],
      ),
    ));
  }
}
