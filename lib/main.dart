import 'package:hadath/screens/speakerscreen.dart';
import 'package:flutter/material.dart';
import './splash_main_screen.dart';
import './screens/login.dart';
import './screens/sessiondetails-screen.dart';
import './screens/speakerdetails-screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Hadath',
      theme: ThemeData(
     
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => SplachMainScreen(), 
        //  LoginScreen(),
        SessionDetailsScreen.routeName :(ctx)=> SessionDetailsScreen(),

        SpeakerDetailsScreen.routeName :(ctx) => SpeakerDetailsScreen(),
      },
    );
  }
}

