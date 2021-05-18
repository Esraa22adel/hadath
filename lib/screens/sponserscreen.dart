import 'package:flutter/material.dart';
import '../models/sharedData.dart';
import '../apis/Api.dart';

class SponserScreen extends StatefulWidget {
  SponserScreen({Key key}) : super(key: key);

  @override
  _SponserScreenState createState() => _SponserScreenState();
}

class _SponserScreenState extends State<SponserScreen> {
  Future<List<ShardData>> sponsers;
  @override
  void initState() {
    super.initState();
    sponsers = API.getAllSponsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: FutureBuilder<List<ShardData>>(
              future: sponsers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int i) {
                      return Center(
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.only(top: 20,bottom:20),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.2,
                                // child: Text(snapshot.data[i].title),
                                child: Image.network(
                                  'https://moh.hadath.app' +
                                      snapshot.data[i].fieldimage,
                                ),
                              ),
                            )
                          ],
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

