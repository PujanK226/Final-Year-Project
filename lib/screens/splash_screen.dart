import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3685CE),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 150, 10, 0),
              child: Image.asset(
                'assets/app_logo.png',
                width: MediaQuery.of(context).size.width - 10,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 6.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading ...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
