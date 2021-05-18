import 'package:flutter/material.dart';
import '../models/typeData.dart';
import '../screens/signupscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../apis/api.dart';

class VerifyForm extends StatefulWidget {
  @override
  VerifyFormState createState() {
    return VerifyFormState();
  }
}

class VerifyFormState extends State<VerifyForm> {
  String mail;
  String field_mobile;
  String field_email_verification_code;
  String field_mobile_verification_code;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    API.sendCode(mail);
    API.verifyCode(mail, field_email_verification_code);
    API.sendCode(field_mobile);
    API.verifyCode(field_mobile, field_mobile_verification_code);
  }

  saveData(mail, field_email_verification_code) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('email', mail);
    prefs.setString('code', field_email_verification_code);
  }

  saveDataMobile(field_mobile, field_mobile_verification_code) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('field_mobile', field_mobile);
    prefs.setString('code', field_mobile_verification_code);
  }

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
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
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
                          Icons.email,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 32),
                      child: RaisedButton(
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: Colors.transparent,
                        child: Text(
                          'send Verify code',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 10,
                              fontFamily: 'Cairo-Regular'),
                        ),
                        onPressed: () {
                          API.sendCode(mail);
                        },
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
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
                          Icons.mark_email_read,
                          color: Colors.purple,
                        ),
                        hintText: 'Email verification code',
                      ),
                      onChanged: (value) {
                        setState(() {
                          field_email_verification_code = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.purpleAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: RaisedButton(
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: Colors.transparent,
                        child: Text("Next",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo-Regular'),),
                        onPressed: () async {
                          var v = await API.verifyCode(
                              mail, field_email_verification_code);
                          if (v == true) {
                            saveData(mail, field_email_verification_code);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()),
                            );
                          } else {
                            print("error");
                          }
                        }),
                  ),
                ],
              ),
            );
          } else if (snapshot.data[0].mobile_verification_required == '1')
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
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
                          hintText: 'phone',
                        ),
                        onChanged: (value) {
                          setState(() {
                            field_mobile = value;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 1, right: 32),
                        child: RaisedButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          color: Colors.transparent,
                          child: Text(
                            'send Verify code',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 10,
                                fontFamily: 'Cairo-Regular'),
                          ),
                          onPressed: () {
                            API.sendCode(field_mobile);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
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
                          //  suffixIcon: Icon(Icons.email),

                          border: InputBorder.none,

                          icon: Icon(
                            Icons.mark_email_read,
                            color: Colors.purple,
                          ),
                          hintText: 'mobile verification code',
                        ),
                        onChanged: (value) {
                          setState(() {
                            field_mobile_verification_code = value;
                          });
                        },
                      ),
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
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
                                'Next'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo-Regular'),
                              ),
                              onPressed: () async {
                                var v = await API.verifyCode(field_mobile,
                                    field_mobile_verification_code);
                                if (v == true) {
                                  saveDataMobile(field_mobile,
                                      field_mobile_verification_code);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()),
                                  );
                                } else {
                                  print("${snapshot.error}");
                                }
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
        }

        print("data");

        print("${snapshot.data}");
        return Text("${snapshot.error}");
        // CircularProgressIndicator();
      },
    ));
  }
}
