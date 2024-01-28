import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {

  final Color? color;

  const LoadingPage({super.key, this.color});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}