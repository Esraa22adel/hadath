import '../screens/verifyscreen.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../screens/tabsscreen.dart';
import '../apis/Api.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String name;
  String pass;
  final data = GlobalKey<ScaffoldState>();
 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width / 1.2,
                     height: 45,
                     margin: EdgeInsets.only(top: 32),
                     padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(50)),
                         color: Colors.white,
                         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                     child: TextFormField(
                          style: TextStyle(fontFamily: 'Cairo-Regular'),

                       decoration: InputDecoration(
                         border: InputBorder.none,
                         icon: Icon(
                           Icons.person,
                           color: Colors.purple,
                         ),
                         hintText: 'Username',
                       ),
                       onChanged: (value) {
                         setState(() {
                           name = value;
                         });
                       },
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width / 1.2,
                     height: 45,
                     margin: EdgeInsets.only(top: 32),
                     padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(50)),
                         color: Colors.white,
                         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                     child: TextFormField(
                         style: TextStyle(fontFamily: 'Cairo-Regular'),

                       obscureText: true,
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
                   Align(
                     alignment: Alignment.centerRight,
                     child: Padding(
                       padding: const EdgeInsets.only(top: 16, right: 32),
                       child: Text(
                         'Forgot Password ?',
                         style: TextStyle(color: Colors.grey,fontFamily: 'Cairo-Regular'),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   InkWell(
                     onTap: () {
                       Navigator.pushNamed(context, '/');
                     },
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
                           borderRadius: BorderRadius.all(Radius.circular(50))),
                       child: SizedBox(
                         width: double.infinity,
                         child: RaisedButton(
                           elevation: 0,
                           hoverElevation: 0,
                           focusElevation: 0,
                           highlightElevation: 0,
                           color: Colors.transparent,
                           child: Text(
                             'Login'.toUpperCase(),
                             style: TextStyle(
                                 color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Cairo-Regular'),
                           ),
                           onPressed: () {
                             API.login(User(name: name, pass: pass)).then((user) {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => TabsScreen()),
                               );
                               // data.currentState.showSnackBar(SnackBar(
                               // content: Text('the user loged in successfuly')));
                             });
                           },
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   InkWell(
                     
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text("Don't have an account ?",style: TextStyle(fontFamily: 'Cairo-Regular'),),
                         Text(
                           "Sign Up",
                           style: TextStyle(
                             color: Colors.purple,
                             fontFamily: 'Cairo-Regular'
                           ),
                         )
                       ],
                     ),
                     onTap: () {
                        Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) =>
                                  //  TabsScreen())
                                   VerifyScreen()),
                               );
                     },
                   ),
                 ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
