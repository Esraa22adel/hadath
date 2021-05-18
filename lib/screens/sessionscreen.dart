
import '../screens/sessiondetails-screen.dart';
import 'package:flutter/material.dart';
import '../models/session.dart';

import '../apis/Api.dart';

class SessionScreen extends StatefulWidget {
  SessionScreen({Key key}) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  Future<List<Session>> sessions;
  String title;
  String attachments;
  String fieldcontent;
  String field_end_date;
  String fieldimage;
  String field_location;
  String field_start_date;
  String join_zoom;
  String nid;

  @override
  void initState() {
    super.initState();
    sessions = API.getAllSessions();
    print(sessions);
    // print(join_zoom);
  }

  void selectsession(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SessionDetailsScreen.routeName, arguments: {
      'title': title,
      'nid': nid,
      'fieldimage': fieldimage,
      'fieldcontent': fieldcontent,
      'attachments': attachments,
      'field_end_date': field_end_date,
      'field_location': field_location,
      'field_start_date': field_start_date,
      'join_zoom': join_zoom
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: FutureBuilder<List<Session>>(
          future: sessions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("${snapshot.data}");

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int i) {
                  return InkWell(
                    onTap: () {
                      nid = snapshot.data[i].nid;

                      title = snapshot.data[i].title;
                      fieldimage = snapshot.data[i].image;
                      fieldcontent = snapshot.data[i].content;
                      field_start_date = snapshot.data[i].startdate;
                      field_location = snapshot.data[i].location;
                      field_end_date = snapshot.data[i].enddate;
                      join_zoom = snapshot.data[i].joinzoom;
                      selectsession(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(children: [
                        Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                'https://moh.hadath.app' +
                                    snapshot.data[i].image,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 10,
                              child: Container(
                                width: 300,
                                color: Colors.black54,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  snapshot.data[i].title,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.room,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(snapshot.data[i].location,style:TextStyle(fontFamily: 'Cairo-Regular')),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(snapshot.data[i].startdate,
                                          style: TextStyle(fontSize: 12,fontFamily: 'Cairo-Regular')),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.access_alarms_rounded),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(snapshot.data[i].enddate,
                                          style: TextStyle(fontSize: 12,fontFamily: 'Cairo-Regular')),
                                    ],
                                  ),
                                ]))
                      ]),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
