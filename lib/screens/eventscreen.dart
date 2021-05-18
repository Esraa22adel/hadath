import 'package:flutter/material.dart';
import '../models/event.dart';
import '../apis/Api.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Future<List<Event>> events;
  @override
  void initState() {
    super.initState();
    events = API.getAllEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder<List<Event>>(
        future: events,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int i) {
                return Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                            'https://moh.hadath.app' + snapshot.data[i].image)),
                    Container(
                        child: Text(
                      snapshot.data[i].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo-Regular'),
                    )),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data[i].content,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontFamily: 'Cairo-Regular'),
                        )),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
