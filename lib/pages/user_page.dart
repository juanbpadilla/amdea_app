import 'package:amdea_app/providers/login_form_provider.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/ui/input_decorations.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    final authProvider = Provider.of<LoginFormProvider>(context, listen: false);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
                  children: [
                    Column(
                      children: [
                        SizedBox(height: height * 0.03),
              
                        Stack(
                          children: [
                            const Positioned(
                              right: 0,
                              bottom: 0,
                              child: Image(image: AssetImage('assets/icons/edit-05.png'),)
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset(
                                'assets/icons/user-circle.svg',
                                width: width * 0.345,
                                // height: 180,
                              ),
                            ),                            
                          ],
                        ),

                        const SizedBox(height: 15,),
              
                        primaryText(
                          'Omar Cayo', 
                          // ((height * 0.17).toInt()).toString(),
                          // ((width * 0.2901).toInt()).toString(),
                          context
                        ),
                        
                      ],
                    ),

                    SizedBox(height: height * 0.02),
              
                    Column(
                      children: [
                        listRow('graduation-hat-01', 'Estudiante', context),
                        listRow('pin-01', 'Publicidad', context),
                        listRow('bookmark-check', 'Ingeniería Comercial', context),
                      ],
                    ),

                    SizedBox(height: height * 0.02),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText('Agregar contactos', context),
                        const SizedBox(height: 5),
                        contactForm(context)                    
                      ],
                    ),

                    SizedBox( height: height * 0.02),

                    Container(
                      width: width * 0.6,
                      child: Text(
                        'Universidad Autónoma Juan Misael Saracho',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.boldFont,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary
                        )
                      ),
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

          const SizedBox( height: 10 ),

          TextButton(
            onPressed: () => displayDialogAndroid(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primaryText('Cambiar Contraseña', context),
                  const Image(image: AssetImage('assets/icons/edit-05.png'),),
                ],
              ),
            ),
          ),

          const SizedBox( height: 5 ),

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

  void displayDialogAndroid(BuildContext context) {

    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Cambiar Contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.boldFont,
                color: AppTheme.lightGrayColor,
                fontSize: 19
              ),
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  child: Column(
                    children: [
          
                      TextFormField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18,
                          fontFamily: AppTheme.primaryFont
                        ),
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecorations.authInputDecoration(
                          hintText: 'Contraseña actual', 
                          labelText: 'Contraseña', 
                          borderColor: AppTheme.background,
                          fontSize: 16,
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
          
                      const SizedBox( height: 5 ),
          
                      TextFormField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18,
                          fontFamily: AppTheme.primaryFont
                        ),
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecorations.authInputDecoration(
                          hintText: 'Nueva Contraseña', 
                          labelText: 'Contraseña', 
                          borderColor: AppTheme.background,
                          fontSize: 16,
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
          
                      const SizedBox( height: 5 ),
          
                      TextFormField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18,
                          fontFamily: AppTheme.primaryFont
                        ),
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecorations.authInputDecoration(
                          hintText: 'Confirmar Contraseña', 
                          labelText: 'Contraseña', 
                          borderColor: AppTheme.background,
                          fontSize: 16,
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
                    ],
                  )
                )
              ],
            ),
          ),
          actions: [

            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomButton(
                  text: 'Guardar',
                  // text: loginForm.isLoading
                  //   ? 'Espere..'
                  //   : 'Guardar',
                  // routeName: loginForm.isLoading ? null : () async {
                  routeName: () {},
                  paddingv: 8,
                  color: AppTheme.primary,
                  textStyle: const TextStyle(
                    color: Colors.white ,
                    fontFamily: AppTheme.mediumFont,
                    fontSize: 21,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        );
      }
    );
  }
}