import 'package:flutter/material.dart';
import '../models/sharedData.dart';
import '../screens/speakerdetails-screen.dart';
import '../apis/Api.dart';

class SpeakerScreen extends StatefulWidget {
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  Future<List<ShardData>> speakers;

  String nid;
  String title;
  String fieldimage;
  String fieldcontent;
  String fieldjob;
  @override
  void initState() {
    super.initState();
    speakers = API.getAllSpeakers();
  }

  void selectspeaker(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SpeakerDetailsScreen.routeName, arguments: {
      'nid': nid,
      'title': title,
      'fieldimage': fieldimage,
      'fieldcontent': fieldcontent,
      'fieldjob': fieldjob,
    });
    print("the id is" + nid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
            child: FutureBuilder<List<ShardData>>(
          future: speakers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int i) {
                  return InkWell(
                    onTap: () {
                      nid = snapshot.data[i].nid;
                      title = snapshot.data[i].title;
                      fieldimage = snapshot.data[i].fieldimage;
                      fieldcontent = snapshot.data[i].fieldcontent;
                      fieldjob = snapshot.data[i].fieldjob;

                      selectspeaker(context);
                    },
                    splashColor: Theme.of(context).primaryColor,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(left: 40),
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 1.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[200],
                            ),
                            child: ListTile(
                              title: Text(
                                snapshot.data[i].title,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,fontFamily: 'Cairo-Regular'),
                              ),
                              subtitle: Text(
                                snapshot.data[i].fieldjob,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,fontFamily: 'Cairo-Regular'),
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 40, bottom: 40, right: 240),
                              child: Image.network(
                                  'https://moh.hadath.app' +
                                      snapshot.data[i].fieldimage,
                                  height: 90,
                                  fit: BoxFit.fill)),
                        ],
                      ),
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
    ));
  }
}
