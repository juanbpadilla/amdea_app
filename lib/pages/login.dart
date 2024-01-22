import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BackgroundWitget(
        widget: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          // physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(0.8),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric( horizontal: 30, vertical: 20  ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
        
                  const SizedBox( height: 10 ),
        
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
      ),
    );
  }
}

