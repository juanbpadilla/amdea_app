import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: buildColumProfile(context),
        ),
      );
  }

  Widget buildDrawerItem(
      {required String title,
        Widget? leading,
        required Function onPressed,
        Color? color,
        double fontSize = 25,
        FontWeight fontWeight = FontWeight.w700,
        double height = 45,
        bool isVisible = false}) {
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        minVerticalPadding: 0,
        dense: true,
        onTap: () => onPressed(),
        leading: leading,
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: AppTheme.boldFont,
                  fontSize: fontSize, fontWeight: fontWeight,
                  color: color
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            isVisible
                ? const CircleAvatar(
              backgroundColor: AppTheme.primary,
              radius: 15,
              child: Text(
                '1',
                style: TextStyle(fontFamily: AppTheme.primaryFont, color: Colors.white),
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }

  void displayDialogAndroid(BuildContext context) {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (builder) {
          return AlertDialog(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // title: const Text(''),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(height: 20,),
                Text(
                  '¿Cerrar esta sesión?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30
                  ),
                ),
                // FlutterLogo( size: 100, )
              ],
            ),
            actions: [

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        text: 'Confirmar',
                        routeName: () => Navigator.pushReplacementNamed(context, 'login'),
                        color: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white ,
                            fontFamily: 'Montserrat_Medium'
                        ),
                    ),
              
                    CustomButton(
                      text: 'Cancelar',
                      routeName: () => Navigator.pop(context),
                      color: Colors.red,
                      textStyle: const TextStyle(
                          color: Colors.white ,
                          fontFamily: 'Montserrat_Medium'
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );
  }

  Widget buildColumProfile(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).colorScheme.primary
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _CircleAvatar(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Omar Cayo',
                              style: TextStyle(
                                  fontFamily: AppTheme.boldFont,
                                  color: AppTheme.primary,
                                  fontSize: 25
                              )
                          ),
                          Row(
                            children: [
                          
                              SvgPicture.asset(
                                'assets/icons/graduation-hat-01.svg',
                                colorFilter: const ColorFilter.mode(
                                  AppTheme.greenColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                          
                              const SizedBox(width: 1),
                          
                              const Text(
                                "Estudiante",
                                style: TextStyle(
                                    fontFamily: AppTheme.boldFont,
                                    fontSize: 20,
                                    color: AppTheme.greenColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ]
                          ),
                          
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios, textDirection: TextDirection.rtl, size: 35, color: Theme.of(context).colorScheme.primary,)
                    )
                  ],
                )
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                buildDrawerItem(
                    title: 'Asistencia',
                    leading: _Icon('check-square.svg'),
                    onPressed: () {}
                  // onPressed: () => Get.to(()=> PaymentScreen())
                ),
                buildDrawerItem(
                  title: 'Calificaciones',
                  leading: _Icon('Doc_15.svg'),
                  onPressed: () {
                    // Navigator.pushNamed(context, 'places');
                  },
                  // isVisible: true
                ),                
                _ListSettings(
                  leading: const _Icon('moon.svg'),
                  // title: _SwitchAdaptative(),
                  title: _Switch(
                    buttonSwitch: Switch(
                        // value: Preferences.isDarkmode,
                        value: true,
                        activeColor: AppTheme.primary,
                        onChanged: (value) {
                          // Preferences.isDarkmode = value;
    
                          // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                          //
                          // value
                          //     ? themeProvider.setDarkmode()
                          //     : themeProvider.setLightMode();
                          //
                          // setState(() {});
                        }
                    ),
                  ),
                ),
                buildDrawerItem(
                  title: 'Ayuda',
                  leading: _Icon('help-square.svg'),
                  onPressed: () {
                    // Navigator.pushNamed(context, 'places');
                  },
                  // isVisible: true
                ),
                buildDrawerItem(
                    title: 'Cerrar Sesión',
                    leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.onBackground),
                    onPressed: () => displayDialogAndroid(context)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/user-circle.svg',
      width: 125,
      height: 125,
    );
  }
}

class _Icon extends StatelessWidget {

  final String icon;

  const _Icon(
      this.icon
      );

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon',
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onBackground,
        BlendMode.srcIn,
      ),
      width: 25,
      height: 25,
    );
  }
}

class _Switch extends StatelessWidget {

  final Widget buttonSwitch;

  const _Switch({required this.buttonSwitch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Modo Oscuro',
            style: TextStyle(
                fontFamily: AppTheme.boldFont,
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary
            ),
          ),
          buttonSwitch,
        ],
      ),
    );
  }
}

class _ListSettings extends StatelessWidget {

  final Widget leading;
  final Widget title;
  final Widget? trailing;
  final Function()? buttonFunction;

  const _ListSettings({
    required this.leading,
    required this.title,
    this.trailing,
    this.buttonFunction
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 45,
      child: ListTile(
        focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: buttonFunction,
        leading: leading,
        title: title,
        trailing: trailing,
        contentPadding: const EdgeInsets.all( 0 ),
      ),
    );
  }
}