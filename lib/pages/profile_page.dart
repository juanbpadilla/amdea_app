import 'package:amdea_app/pages/check_auth_page.dart';
import 'package:amdea_app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../providers/ui_provider.dart';
import '../sercices/auth_service.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    // final uiProvider = Provider.of<UiProvider>(context, listen: false);
    final authProvider = Provider.of<LoginFormProvider>(context, listen: false);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).colorScheme.background,
          child: FutureBuilder(
            future: authProvider.fetchUserDetails(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if ( snapshot.connectionState == ConnectionState.waiting ) {
                return const Center(child: CircularProgressIndicator());
              } else if (authProvider.user!.name.isEmpty ) {
                print('object ${authProvider.user!.name}');
                Future.microtask(() {

                  // uiProvider.selectedMenuOpt = 1;
                  Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: ( _, __, ___) => CheckAuthPage(),
                    transitionDuration: const Duration( seconds: 0 )
                  ));

                });
              } else {
                return Container(
                  width: double.infinity,
                  height: height - 200,
                  child: buildColumProfile(context ,authProvider, width, height),            
                );
              }

              return Container();
            },
          ),
          // child: buildColumProfile(context, authProvider),
        ),
      );
  }

  Widget buildDrawerItem(
      {
        // required String title,
        required Widget title,
        required Widget leading,
        required Function onPressed,
        required double width,
        double height = 45,
        bool isVisible = false
      }
    ) 
  {
    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Row(
          children: [
            leading,
      
            SizedBox(width: width*0.03),
      
            title,
          ],
        ),
      )
    );
  }

  void displayDialogAndroid(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);
    final uiProvider = Provider.of<UiProvider>(context, listen: false);

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
                        routeName: () {
                          authService.logout();
                          uiProvider.selectedMenuOpt = 2;
                          Navigator.pushReplacementNamed(context, 'welcome');
                        },
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

  Widget buildColumProfile(BuildContext context, LoginFormProvider authProvider, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => UserPage(authProvider: authProvider,)),
              // arguments: { 'authProvider': authProvider}
            );
          },
          child: SizedBox(
            height: height * 0.17,
            width: width,
            child: DrawerHeader(
              decoration: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.primary
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: _CircleAvatar(width: width,),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${authProvider.user?.name} ${authProvider.user?.lastname}',
                          // 'Omar Cayo',
                          // ((height * 0.17).toInt()).toString(),
                          // ((width * 0.24).toInt()).toString(),
                          style: const TextStyle(
                              fontFamily: AppTheme.boldFont,
                              color: AppTheme.primary,
                              fontSize: 17
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
                        
                            const SizedBox(width: 2),
                        
                            Text(
                              authProvider.role ?? '',
                              style: const TextStyle(
                                  fontFamily: AppTheme.boldFont,
                                  fontSize: 18,
                                  color: AppTheme.greenColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ]
                        ),
                        
                      ],
                    ),
                  ),
                  
                  SvgPicture.asset(
                      'assets/icons/arrow.svg',
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                      width: 12.25,
                      height: 24.5,
                    ),
                ],
              )
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035),
          child: Column(
            children: [
              buildDrawerItem(
                // title: 'Asistencia',
                title: Text(
                  'Asistencia',
                  style: TextStyle(
                    fontFamily: AppTheme.boldFont,
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                leading: const _Icon('check-square.svg'),
                width: width,
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => AttendancePage()),
                    // arguments: { 'authProvider': authProvider}
                  );
                }
                // onPressed: () => Get.to(()=> PaymentScreen())
              ),
              buildDrawerItem(
                // title: 'Calificaciones',
                title: Text(
                  'Calificaciones',
                  style: TextStyle(
                    fontFamily: AppTheme.boldFont,
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                leading: _Icon('Doc_15.svg'),
                width: width,
                onPressed: () {
                  // Navigator.pushNamed(context, 'places');
                },
                // isVisible: true
              ),                
              buildDrawerItem(
                // title: 'Calificaciones',
                title: _Switch(
                  buttonSwitch: Switch(
                      // value: Preferences.isDarkmode,
                      value: false,
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
                leading: _Icon('moon.svg'),
                width: width,
                onPressed: () {
                  // Navigator.pushNamed(context, 'places');
                },
                // isVisible: true
              ),  
              buildDrawerItem(
                // title: 'Ayuda',
                title: Text(
                  'Ayuda',
                  style: TextStyle(
                    fontFamily: AppTheme.boldFont,
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                leading: _Icon('help-square.svg'),
                width: width,
                onPressed: () {
                  // Navigator.pushNamed(context, 'places');
                },
                // isVisible: true
              ),
              buildDrawerItem(
                // title: 'Cerrar Sesión',
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    fontFamily: AppTheme.boldFont,
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.onBackground),
                width: width,
                onPressed: () => displayDialogAndroid(context)
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CircleAvatar extends StatelessWidget {

  final double width;

  const _CircleAvatar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/user-circle.svg',
      width: 90,
      // height: width * 0.24,
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
    return Expanded(
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Modo Oscuro',
              style: TextStyle(
                  fontFamily: AppTheme.boldFont,
                  fontSize: 23,
                  color: Theme.of(context).colorScheme.primary
              ),
            ),
            buttonSwitch,
          ],
        ),
      ),
    );
  }
}