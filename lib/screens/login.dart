import 'package:flutter/material.dart';
import '../widgets/form.dart';
import '../widgets/drowclip.dart';

class LoginScreen extends StatefulWidget {
  static const ROUTE_NAME = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget child) {
                    return ClipPath(
                      clipper: DrawClip(_controller.value),
                      child: Container(
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                              Colors.deepPurple,
                              Colors.purpleAccent
                            ])),
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Text(
                    'login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo-Regular'),
                  ),
                ),
                // Text(
                //   'Event Confernce',
                //   style: TextStyle(color: Colors.white),
                // )
              ],
            ),
            MyCustomForm()
          ],
        ),
      ),
    );
  }
}
