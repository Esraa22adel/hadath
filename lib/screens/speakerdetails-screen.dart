import 'package:flutter/material.dart';

class SpeakerDetailsScreen extends StatefulWidget {
  static const routeName = 'speaker-detais';

  @override
  _SpeakerDetailsScreenState createState() => _SpeakerDetailsScreenState();
}

class _SpeakerDetailsScreenState extends State<SpeakerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final speakerId = routeArg['nid'];
    final speakerTitle = routeArg['title'];
    final speakerImage = routeArg['fieldimage'];
    final speakerContent = routeArg['fieldcontent'];
    final speakerJob = routeArg['fieldjob'];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.network('https://moh.hadath.app' + speakerImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 16,
                        fontFamily: 'Cairo-Regular'),
                  ),
                  Text(
                    speakerTitle,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Cairo-Regular'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Job",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 16,
                        fontFamily: 'Cairo-Regular'),
                  ),
                  Text(
                    speakerJob,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Cairo-Regular'),
                  )
                ],
              ),
            ),
            Container(
              child: Text(speakerContent,
                  style: TextStyle(fontSize: 12, fontFamily: 'Cairo-Regular')),
            ),
          ],
        ),
      ),
    );
  }
}
