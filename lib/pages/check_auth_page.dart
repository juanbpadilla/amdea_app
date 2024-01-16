import 'package:amdea_app/sercices/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class CheckAuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(), 
          builder: (context, snapshot) {

            if ( !snapshot.hasData ) return const Text('Espere');

            if ( snapshot.data == '' ) {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __, ___) => WelcomePage(),
                  transitionDuration: const Duration( seconds: 0 )
                ));

              });
            } else {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __, ___) => HomePage(),
                  transitionDuration: const Duration( seconds: 0 )
                ));

              });
            }

            return Container();

          },
        ),
      ),
    );
  }
}