import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BackgroundWitget(
        widget: Padding(
          padding: EdgeInsets.all(0.8),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric( horizontal: 30, vertical: 20  ),
            child: Column(
              children: [
                Text(
                  'Inicio de sesión',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                  
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

