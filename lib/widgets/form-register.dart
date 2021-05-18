import 'package:flutter/material.dart';
import '../screens/tabsscreen.dart';
import '../apis/api.dart';
import '../models/res.dart';
import '../models/typeData.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  SharedPreferences prefs;

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      mail = prefs.get('email');
      field_email_verification_code = prefs.get('code');
      field_mobile = prefs.get('field_mobile');
      field_mobile_verification_code = prefs.get('code');

      print(mail);
      print(field_email_verification_code);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    API.getRegion();
  }

  bool valuefirst = false;
  String name;
  String pass;
  String mail;
  String field_first_name;
  String field_middle_name;
  String field_last_name;
  bool field_accept_terms = false;
  String field_region;
  String field_email_verification_code;
  String field_mobile_verification_code;
  String field_mobile;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<TypeData>>(
      future: API.typing(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data[0].email_verification_required == '1') {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Cairo-Regular'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                          hintText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 45,
                          margin: EdgeInsets.only(top: 32),
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Cairo-Regular', fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'first Name',
                            ),
                            onChanged: (value) {
                              setState(() {
                                field_first_name = value;
                              });
                            },
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 45,
                          margin: EdgeInsets.only(top: 32),
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Cairo-Regular', fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Middle Name',
                            ),
                            onChanged: (value) {
                              setState(() {
                                field_middle_name = value;
                              });
                            },
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 45,
                          margin: EdgeInsets.only(top: 32),
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Cairo-Regular', fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'last Name',
                            ),
                            onChanged: (value) {
                              setState(() {
                                field_last_name = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Cairo-Regular'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.stay_current_portrait,
                            color: Colors.purple,
                          ),
                          hintText: 'mobile',
                        ),
                        onChanged: (value) {
                          setState(() {
                            field_mobile = value;
                          });
                        },
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(fontFamily: 'Cairo-Regular'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.purple,
                          ),
                          hintText: 'Password',
                        ),
                        onChanged: (value) {
                          setState(() {
                            pass = value;
                          });
                        },
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Row(
                      children: [
                        Checkbox(
                          value: field_accept_terms,
                          onChanged: (value) {
                            setState(() {
                              field_accept_terms = !field_accept_terms;
                            });
                          },
                        ),
                        Text('accept Terms'),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: FutureBuilder(
                        future: API.getRegion(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return snapshot.hasData
                              ? Container(
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      field_region ?? 'select region',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-Regular'),
                                    ),
                                    items: snapshot.data
                                        .map<DropdownMenuItem<String>>((item) {
                                      return DropdownMenuItem<String>(
                                        value: item.name,
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Regular'),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        field_region = value;
                                        print(value);
                                      });
                                    },
                                  ),
                                )
                              : Container(
                                  child: Center(
                                    child: Text('Loading...'),
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.purpleAccent,
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 0,
                            hoverElevation: 0,
                            focusElevation: 0,
                            highlightElevation: 0,
                            color: Colors.transparent,
                            child: Text(
                              'SignUp'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo-Regular'),
                            ),
                            onPressed: () {
                              API
                                  .signup(ResModel(
                                      name: name,
                                      pass: pass,
                                      mail: mail,
                                      field_first_name: field_first_name,
                                      field_middle_name: field_middle_name,
                                      field_last_name: field_last_name,
                                      field_accept_terms: field_accept_terms,
                                      field_email_verification_code:
                                          field_email_verification_code,
                                      field_mobile: field_mobile,
                                      field_region: field_region))
                                  .then((user) {
                                print("register up scuccessfuly");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabsScreen()));
                              });
                            },
                          ),
                        ),
                      ))
                ],
              ),
            );
          } else if (snapshot.data[0].mobile_verification_required == '1')
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          style: TextStyle(fontFamily: 'Cairo-Regular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Colors.purple,
                            ),
                            hintText: 'Name',
                          ),
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              style: TextStyle(fontFamily: 'Cairo-Regular'),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'first Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  field_first_name = value;
                                });
                              },
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.8,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              style: TextStyle(fontFamily: 'Cairo-Regular'),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Middle Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  field_middle_name = value;
                                });
                              },
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              style: TextStyle(fontFamily: 'Cairo-Regular'),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'last Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  field_last_name = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          style: TextStyle(fontFamily: 'Cairo-Regular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.stay_current_portrait,
                              color: Colors.purple,
                            ),
                            hintText: 'Email',
                          ),
                          onChanged: (value) {
                            setState(() {
                              mail = value;
                            });
                          },
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          style: TextStyle(fontFamily: 'Cairo-Regular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.purple,
                            ),
                            hintText: 'Password',
                          ),
                          onChanged: (value) {
                            setState(() {
                              pass = value;
                            });
                          },
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: Row(
                          children: [
                            Checkbox(
                              value: field_accept_terms,
                              onChanged: (value) {
                                setState(() {
                                  field_accept_terms = !field_accept_terms;
                                });
                              },
                            ),
                            Text(
                              'accept Terms',
                              style: TextStyle(fontFamily: 'Cairo-Regular'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: FutureBuilder(
                          future: API.getRegion(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? Container(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          field_region ?? 'select region',
                                          style: TextStyle(fontFamily: "cairo"),
                                        ),
                                        items: snapshot.data
                                            .map<DropdownMenuItem<String>>(
                                                (item) {
                                          return DropdownMenuItem<String>(
                                            value: item.name,
                                            child: Text(item.name),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            field_region = value;
                                            print(value);
                                          });
                                        },
                                        underline: SizedBox(),
                                        isExpanded: false,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Center(
                                      child: Text(
                                        'Loading...',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Regular'),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple,
                                  Colors.purpleAccent,
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              color: Colors.transparent,
                              child: Text(
                                'SignUp'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo-Regular'),
                              ),
                              onPressed: () {
                                API
                                    .signup(ResModel(
                                        name: name,
                                        pass: pass,
                                        mail: mail,
                                        field_first_name: field_first_name,
                                        field_middle_name: field_middle_name,
                                        field_last_name: field_last_name,
                                        field_accept_terms: field_accept_terms,
                                        field_email_verification_code:
                                            field_email_verification_code,
                                        field_mobile: field_mobile,
                                        field_region: field_region))
                                    .then((ResModel) {
                                  print("register up scuccessfuly");
                                });
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        print("data");

        print("${snapshot.data}");
        return Text("${snapshot.error}");
        // CircularProgressIndicator();
      },
    ));
  }
}
