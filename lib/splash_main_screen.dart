import './screens/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class SplachMainScreen extends StatefulWidget {
  SplachMainScreen({Key key}) : super(key: key);

  @override
  _SplachMainScreenState createState() => _SplachMainScreenState();
}

class _SplachMainScreenState extends State<SplachMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: LoginScreen(),
        // title: Text(
        //   "Hadath App",
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Cairo-Regular'),
        // ),
        backgroundColor: Colors.purple,
        image: new Image.asset(
          'images/hadath_logo.png',
        ),
        loadingText: Text(
          "Loading",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo-Regular'),
        ),
        photoSize: 90,
        loaderColor: Colors.white,
      ),
    ));
  }
}
