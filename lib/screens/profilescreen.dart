import '../apis/Api.dart';
import '../models/profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<List<Profile>> pofile;
  @override
  void initState() {
    super.initState();
    pofile = API.getProfile();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: FutureBuilder<List<Profile>>(
          future: pofile,
          builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int i) {
              return Center(
                child:Column(
        children: [
          Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.purpleAccent]
              )
          ),
          child: Container(
            width: double.infinity,
            height: 350.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[i].user_picture
                      // "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                    ),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    snapshot.data[i].field_full_name,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'Cairo-Regular'
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(

                              children: [
                                Text(
                                  "mobile",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  snapshot.data[i].field_mobile,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.purpleAccent,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(

                              children: [
                                Text(
                                  "Certificate",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  snapshot.data[i].field_certified,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.purpleAccent,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(

                              children: [
                                Text(
                                  "Region",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  snapshot.data[i].field_region,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.purpleAccent,
                                    fontFamily: 'Cairo-Regular'
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          ),
          Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "mail:",
                style: TextStyle(
                    color: Colors.purpleAccent,
                    fontStyle: FontStyle.normal,
                    fontSize: 28.0,
                    fontFamily: 'Cairo-Regular'
                    
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(snapshot.data[i].mail,
                style: TextStyle(
                  fontSize: 22.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontFamily: 'Cairo-Regular'
                ),
              ),
            ],
          ),
        ),
          ),
          SizedBox(
        height: 20.0,
          ),
          Container(
        width: 300.00,

        child: RaisedButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)
            ),
            elevation: 0.0,
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.purple,Colors.purpleAccent]
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text("Certificate",
                  style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300,fontFamily: 'Cairo-Regular'),
                ),
              ),
            )
        ),
          ),
        ],
      ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Text("${snapshot.error}");
          },
        )
    );
  }
}
