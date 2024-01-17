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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 25,),

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: const Image(image: AssetImage('assets/logo.png'))
                        ),
              
                        Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/user-circle.svg',
                              width: 160,
                              height: 160,
                            ),
                            const Positioned(
                              right: 11,
                              bottom: 17,
                              child: Image(image: AssetImage('assets/icons/edit-05.png'),)
                            ),
                          ],
                        ),
              
                        primaryText('Omar Cayo', context),
                        
                      ],
                    ),

                    const SizedBox(height: 15),
              
                    Column(
                      children: [
                        listRow('graduation-hat-01', 'Estudiante', context),
                        listRow('pin-01', 'Publicidad', context),
                        listRow('bookmark-check', 'Ingeniería Comercial', context),
                      ],
                    ),

                    const SizedBox(height: 17),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText('Agregar contactos', context),
                        const SizedBox(height: 5),
                        contactForm(context)                    
                      ],
                    ),

                    const SizedBox( height: 15,),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Universidad Autónoma Juan Misael Saracho',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.boldFont,
                              fontSize: 17,
                              color: Theme.of(context).colorScheme.onPrimary
                            )
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox( height: 5),
              Text(
                'Facultad de Ciencias Empresariales',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTheme.primaryFont,
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onPrimary
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget primaryText(String text, BuildContext context) {
    return Text(text, style: const TextStyle(
      fontFamily: AppTheme.boldFont,
      fontSize: 18,
      color: AppTheme.primary,
    ));
  }

  Widget listRow(String icon, String text, BuildContext context) {
    return Row(
      children: [
    
        SvgPicture.asset(
          'assets/icons/$icon.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
        ),
    
        const SizedBox(width: 10),
    
        Text(
          text,
          style: TextStyle(
              fontFamily: AppTheme.boldFont,
              fontSize: 18,
              color: Theme.of(context).colorScheme.onPrimary,
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
              fontSize: 18,
              fontFamily: AppTheme.primaryFont
            ),
            autocorrect: false,
            keyboardType: TextInputType.phone,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Celular', 
              labelText: 'Celular', 
              prefixIcon: Icons.phone_outlined,
              suffixIcon: 'edit-05',
              context: context,
            ),
            onChanged: (value) {},
            validator: (value) {
              return (value != null && value.length >= 5)
                  ? null
                  : 'La contraseña debe contener 6 o más caracteres';
            },
          ),

          const SizedBox( height: 8 ),

          TextFormField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18,
              fontFamily: AppTheme.primaryFont
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Correo', 
              labelText: 'Correo', 
              prefixIcon: Icons.email_outlined,
              suffixIcon: 'edit-05',
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

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                primaryText('Cambiar Contraseña', context),
                const Image(image: AssetImage('assets/icons/edit-05.png'),),
              ],
            ),
          ),

          const SizedBox( height: 17 ),

          CustomButton(
              text: 'Guardar',
              // text: loginForm.isLoading
              //   ? 'Espere..'
              //   : 'Guardar',
              // routeName: loginForm.isLoading ? null : () async {
              routeName: () {},
              paddingv: 6,
              color: AppTheme.primary,
              textStyle: const TextStyle(
                color: Colors.white ,
                fontFamily: AppTheme.mediumFont,
                fontSize: 27,
                fontWeight: FontWeight.w500
              ),
            ),

        ],
      )
    );
  }
}