import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/ui/input_decorations.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox( height: 50 ),

          TextFormField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontFamily: 'Montserrat'
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Correo', 
              labelText: 'Correo', 
              prefixIcon: Icons.email,
            ),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no es un correo';
            },
          ),

          const SizedBox( height: 20 ),

          TextFormField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontFamily: 'Montserrat'
            ),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Contraseña', 
              labelText: 'Contraseña', 
              prefixIcon: Icons.lock

            ),
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe contener 6 o más caracteres';
            },
          ),

          const SizedBox( height: 30 ),

          // FormButton( 
          //   // routeName: 'home',
          //   name: 'Acceder',
          //   color: AppTheme.primary,
          //   textStyle: Theme.of(context).textTheme.headlineSmall,
          //   loginForm: () {
          //     // Navigation
          //   }
          // ),

          CustomButton(
              text: 'Acceder',
              routeName: () => Navigator.pushNamed(context, 'home'),
              color: AppTheme.primary,
              textStyle: const TextStyle(
                color: Colors.white ,
                fontFamily: 'Montserrat_Medium',
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),

          const SizedBox( height: 20,),

          const Text('Olvide mi contraseña', style: TextStyle(
            color: AppTheme.primary,
            fontFamily: 'Montserrat',
            fontSize: 20
          )),

        ],
      )
    );
  }
}