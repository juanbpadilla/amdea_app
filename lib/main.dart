import 'package:amdea_app/pages/pages.dart';
import 'package:amdea_app/providers/login_form_provider.dart';
import 'package:amdea_app/providers/ui_provider.dart';
import 'package:amdea_app/sercices/auth_service.dart';
import 'package:amdea_app/sercices/book_service.dart';
import 'package:amdea_app/share_preferences/preferences.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'sercices/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => BookService()),
      ChangeNotifierProvider(create: ( _ ) => AuthService()),
      ChangeNotifierProvider(create: ( _ ) => LoginFormProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amdea',
      initialRoute: 'welcome',
      routes: {
        'welcome':  (_) => WelcomePage(),
        'login'  :  (_) => LoginPage(),
        'home': (_) => HomePage(),
        'profile': (_) => ProfilePage(),
        'activity': (_) => ActivityWidget(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    
    );
  }
}
