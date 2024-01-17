import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/ui/input_decorations.dart';
import 'package:amdea_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../sercices/auth_service.dart';
import '../sercices/notifications_service.dart';

class LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(

      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
              hintText: 'Usuario', 
              labelText: 'Usuario', 
              prefixIcon: Icons.person_2_outlined,
              context: context,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {

              return (value != null && value.length >= 4)
                  ? null
                  : 'El usuario debe contener 4 o más caracteres';
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
              prefixIcon: Icons.lock,
              context: context,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 5)
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
              text: loginForm.isLoading
                ? 'Espere..'
                : 'Ingresar',
              routeName: loginForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();
                  final authService = Provider.of<AuthService>(context, listen: false);

                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  // TODO: validar si el loading es correcto
                  // ignore: unused_local_variable
                  final String? errorMessage = await authService.login(
                    loginForm.email, 
                    loginForm.password
                  );

                  if ( errorMessage == null ) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    //  TODO: mostrar error en pantalla
                    print(errorMessage);
                    NotificationsService.showSnackbar(errorMessage, Theme.of(context).colorScheme.onBackground, Theme.of(context).colorScheme.background);
                    loginForm.isLoading = false;
                  }
              },
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