import 'package:flutter/material.dart';
import '../widgets/drowclip.dart';
import '../widgets/form-verify.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({Key key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen>
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
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo-Regular'),
                  ),
                ),
              ],
            ),
            VerifyForm()
          ],
        ),
      ),
    );
  }
}
