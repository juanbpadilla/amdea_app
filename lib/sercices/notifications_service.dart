import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar( String message, Color color , Color backgroundColor) {

    final snackBar = SnackBar(
      backgroundColor: backgroundColor.withOpacity(0),
      elevation: 0,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // margin: const EdgeInsets.symmetric( horizontal: 20 ),
          padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 20 ),
          color: AppTheme.primary.withOpacity(0.4),
          child: Text( message, style: TextStyle( color: color, fontSize: 18 ) )
        ),
      )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

}