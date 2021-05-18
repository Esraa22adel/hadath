import 'package:flutter/material.dart';
import '../models/statistics.dart';

import '../apis/Api.dart';

class StaticScreen extends StatefulWidget {
  StaticScreen({Key key}) : super(key: key);

  @override
  _StaticScreenState createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
  Future<List<Statistics>> statistics;
  @override
  void initState() {
    super.initState();
    statistics = API.getAllS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistics",style: TextStyle(fontFamily: 'Cairo-Regular'),),
),
        body: Container(
      width: 800,
      child: Center(
          child: FutureBuilder<List<Statistics>>(
        future: statistics,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Member",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20,fontFamily: 'Cairo-Regular'),),
                                Icon(Icons.people_outline_rounded,color: Colors.purple,size: 45,),
                                Text(snapshot.data[i].members.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 19,fontFamily: 'Cairo-Regular'),),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Sponser",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20,fontFamily: 'Cairo-Regular'),),
                                Icon(Icons.supervisor_account,color: Colors.purple,size: 45,),
                                Text(snapshot.data[i].sponsors.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 19,fontFamily: 'Cairo-Regular'),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Speaker",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20,fontFamily: 'Cairo-Regular'),),
                                Icon(Icons.campaign,color: Colors.purple,size: 45,),
                                Text(snapshot.data[i].speakers.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 19,fontFamily: 'Cairo-Regular'),),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Session",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20,fontFamily: 'Cairo-Regular'),),
                                Icon(Icons.update,color: Colors.purple,size: 45,),
                                Text(snapshot.data[i].sessions.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 19,fontFamily: 'Cairo-Regular'),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }

          print("${snapshot.data}");
          return Text("${snapshot.data}");
        },
      )),
    ));
  }
}
