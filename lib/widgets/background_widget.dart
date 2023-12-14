import 'package:flutter/material.dart';

class BackgroundWitget extends StatelessWidget {
  final Widget widget;

  const BackgroundWitget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Color(0xFFFFC107),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: widget,
        )
      ),
    );
  }
}
