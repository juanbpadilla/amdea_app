import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/ui/input_decorations.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontFamily: AppTheme.mediumFont,
          color: Theme.of(context).colorScheme.background,
          fontSize: 25
        ),
        centerTitle: true,
        title: const Text('Perfil'),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 40, bottom: 15),
                      child: Image(image: AssetImage('assets/logo.png')),
                    ),
          
                    SvgPicture.asset(
                      'assets/icons/user-circle.svg',
                      width: 180,
                      height: 180,
                    ),
          
                    primaryText('Omar Cayo'),
                    
                  ],
                ),

                const SizedBox(height: 10),
          
                Column(
                  children: [
                    listRow('graduation-hat-01', 'Estudiante'),
                    listRow('pin-01', 'Publicidad'),
                    listRow('bookmark-check', 'Ingeniería Comercial'),
                  ],
                ),

                const SizedBox(height: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    primaryText('Agregar contactos'),
                    contactForm(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget primaryText(String text) {
    return Text(text, style: const TextStyle(
      fontFamily: AppTheme.boldFont,
      fontSize: 20,
      color: AppTheme.primary,
    ));
  }

  Widget listRow(String icon, String text) {
    return Row(
      children: [
    
        SvgPicture.asset(
          'assets/icons/$icon.svg',
          colorFilter: const ColorFilter.mode(
            AppTheme.grayColor,
            BlendMode.srcIn,
          ),
        ),
    
        const SizedBox(width: 10),
    
        Text(
          text,
          style: const TextStyle(
              fontFamily: AppTheme.boldFont,
              fontSize: 20,
              color: AppTheme.grayColor,
          ),
          overflow: TextOverflow.ellipsis,
        )
      ]
    );
  }

  Widget contactForm(BuildContext context) {
    return Form(
      child: Column(
        children: [

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
              context: context,
            ),
            onChanged: (value) {},
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
              prefixIcon: Icons.lock,
              context: context,
            ),
            onChanged: (value) {},
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
              text: 'Guardar',
              // text: loginForm.isLoading
              //   ? 'Espere..'
              //   : 'Guardar',
              // routeName: loginForm.isLoading ? null : () async {
              routeName: () {},
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