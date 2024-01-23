import 'package:amdea_app/models/user.dart';
import 'package:amdea_app/providers/login_form_provider.dart';
import 'package:amdea_app/providers/update_form_provider.dart';
import 'package:amdea_app/sercices/auth_service.dart';
import 'package:amdea_app/sercices/notifications_service.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/ui/input_decorations.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {

  final LoginFormProvider authProvider;

  const UserPage({
    required this.authProvider
  });

  @override
  Widget build(BuildContext context) {

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
                          // 'Omar Cayo', 
                          '${authProvider.user?.name} ${authProvider.user?.lastname}',
                          // ((height * 0.17).toInt()).toString(),
                          // ((width * 0.2901).toInt()).toString(),
                          context
                        ),
                        
                      ],
                    ),

                    SizedBox(height: height * 0.02),
              
                    Column(
                      children: [
                        listRow('graduation-hat-01', authProvider.role ?? '', context),
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
                        contactForm(context, authProvider)                    
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

  Widget contactForm(BuildContext context, LoginFormProvider authProvider) {
    return Form(
      key: authProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
              suffixIcon: Image(image: AssetImage('assets/icons/edit-05.png'),),
              context: context,
            ),
            onChanged: (value) => authProvider.user!.phone = value,
            initialValue: authProvider.user?.phone ?? '',
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
              suffixIcon: Image(image: AssetImage('assets/icons/edit-05.png'),),
              context: context,
            ),
            onChanged: (value) => authProvider.user!.email = value,
            initialValue: authProvider.user?.email ?? '',
            validator: (value) {
              if (value == '') {
                return null;
              } else {
                String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo';
              }
              
            },
          ),

          const SizedBox( height: 10 ),

          TextButton(
            onPressed: () {
              final passUpdate = Provider.of<UpdateFormProvider>(context, listen: false);

              passUpdate.obscureText = true;

              displayDialogAndroid(context, authProvider);
            },
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
              // text: 'Guardar',
              text: 'Guardar',
              routeName: authProvider.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthService>(context, listen: false);

                if (!authProvider.isValidForm()) return;

                authProvider.isLoading = true;

                final User? newUser = await authService.updateUser(authProvider.user!);

                if ( newUser != null ) {

                  authProvider.saveUserData(newUser);

                  authProvider.isLoading = false;
                  const String errorMessage = 'Información actualizada con exito!';
                  NotificationsService.showSnackbar(errorMessage, Theme.of(context).colorScheme.onBackground, Theme.of(context).colorScheme.background);
                } else {
                  print("Algo salio mal");
                  authProvider.isLoading = false;
                }

              },
              paddingv: 6,
              color: Theme.of(context).colorScheme.primary,
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

  void displayDialogAndroid(BuildContext context, LoginFormProvider authProvider) {

    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Consumer<UpdateFormProvider>(
          builder: (context, updateFormProvider, child) {
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
                      key: updateFormProvider.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
              
                          TextFormField(
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18,
                              fontFamily: AppTheme.primaryFont
                            ),
                            autocorrect: false,
                            obscureText: updateFormProvider.obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecorations.authInputDecoration(
                              hintText: 'Contraseña actual', 
                              labelText: 'Contraseña', 
                              borderColor: AppTheme.background,
                              fontSize: 16,
                              prefixIcon: Icons.lock,
                              context: context,
                              suffixIcon: IconButton(
                                icon: Icon(updateFormProvider.obscureText ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                    updateFormProvider.toggleVisibility();
                                },
                              ),
                            ),
                            onChanged: (value) => updateFormProvider.old_password = value,
                            validator: (value) {
                              return (value != null && value.length >= 5)
                                  ? null
                                  : 'Debe tener 5 o más caracteres';
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
                            obscureText: updateFormProvider.obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecorations.authInputDecoration(
                              hintText: 'Nueva Contraseña', 
                              labelText: 'Contraseña', 
                              borderColor: AppTheme.background,
                              fontSize: 16,
                              prefixIcon: Icons.lock,
                              context: context,
                            ),
                            onChanged: (value) => updateFormProvider.password = value,
                            validator: (value) {
                              return (value != null && value.length >= 5)
                                  ? null
                                  : 'Debe tener 5 o más caracteres';
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
                            obscureText: updateFormProvider.obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecorations.authInputDecoration(
                              hintText: 'Confirmar Contraseña', 
                              labelText: 'Contraseña', 
                              borderColor: AppTheme.background,
                              fontSize: 16,
                              prefixIcon: Icons.lock,
                              context: context,
                            ),
                            onChanged: (value) => updateFormProvider.passwordConfirmation = value,
                            validator: (value) {
                              return (value != null && value == updateFormProvider.password)
                                ? null
                                : 'Las contraseñas no coinciden';
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
                      routeName: updateFormProvider.isLoading ? null : () async {
                        FocusScope.of(context).unfocus();
                        final authService = Provider.of<AuthService>(context, listen: false);

                        if (!updateFormProvider.isValidForm()) return;

                        updateFormProvider.isLoading = true;

                        // final User? newUser = await authService.updateUser(updateFormProvider.user!);

                        print(
                          authProvider.user!.id.toString()
                        );
                        print(
                          updateFormProvider.old_password
                        );
                        print(
                          updateFormProvider.password
                        );
                        print(
                          updateFormProvider.passwordConfirmation
                        );

                        final String? errorMessage = await authService.updatePassword(
                          authProvider.user!.id.toString(),
                          updateFormProvider.old_password,
                          updateFormProvider.password,
                          updateFormProvider.passwordConfirmation
                        );

                        if ( errorMessage == null ) {

                          // updateFormProvider.saveUserData(newUser);

                          updateFormProvider.isLoading = false;
                          const String errorMessage = 'Información actualizada con exito!';
                          Navigator.pop(context);
                          NotificationsService.showSnackbar(errorMessage, Theme.of(context).colorScheme.onBackground, Theme.of(context).colorScheme.background);
                        } else {
                          print(errorMessage);
                          NotificationsService.showSnackbar(errorMessage, Theme.of(context).colorScheme.onBackground, Theme.of(context).colorScheme.background);
                          updateFormProvider.isLoading = false;
                        }

                      },
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
    );
  }
}