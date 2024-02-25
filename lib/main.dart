import 'package:amdea_app/pages/check_auth_page.dart';
import 'package:amdea_app/pages/multimedia/conceptos_video_page.dart';
import 'package:amdea_app/pages/multimedia/illustrator_video_page.dart';
import 'package:amdea_app/pages/multimedia/multimedia_photoshop/photoshop_playlist_page.dart';
import 'package:amdea_app/pages/pages.dart';
import 'package:amdea_app/providers/attendance_provider.dart';
import 'package:amdea_app/providers/login_form_provider.dart';
import 'package:amdea_app/providers/ui_provider.dart';
import 'package:amdea_app/providers/update_form_provider.dart';
import 'package:amdea_app/sercices/auth_service.dart';
import 'package:amdea_app/sercices/book_service.dart';
import 'package:amdea_app/sercices/topic_service.dart';
import 'package:amdea_app/share_preferences/preferences.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'sercices/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => BookService()),
      ChangeNotifierProvider(create: (_) => AttendanceProvider()),
      ChangeNotifierProvider(create: ( _ ) => AuthService()),
      ChangeNotifierProvider(create: ( _ ) => LoginFormProvider()),
      ChangeNotifierProvider(create: ( _ ) => UpdateFormProvider()),
      ChangeNotifierProvider(create: ( _ ) => TopicService()),
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
      initialRoute: 'checking',
      routes: {
        'checking': ( _ ) => CheckAuthPage(),
        'welcome':  (_) => WelcomePage(),
        'login'  :  (_) => LoginPage(),
        'home': (_) => HomePage(),
        'profile': (_) => ProfilePage(),
        // 'user': (_) => UserPage(),
        'activity': (_) => const ActivityWidget(),
        // 'attendance': (_) => AttendancePage()
        'multimedia/video/conceptos'  : (BuildContext context) => const ConceptosVideoPage(),
        'multimedia/video/photoshop'  : (BuildContext context) => const PhotoshopPlaylistPage(),
        // 'multimedia/video/photoshop'  : (BuildContext context) => PlaylistPage(),
        'multimedia/video/illustrator': (BuildContext context) => const IllustratorVideoPage(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    
    );
  }
}
