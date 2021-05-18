import 'package:flutter/material.dart';
import '../screens/login.dart';
import '../screens/profilescreen.dart';
import '../screens/staticscreen.dart';
import '../screens/sponserscreen.dart';
import '../screens/eventscreen.dart';
import '../screens/sessionscreen.dart';
import '../screens/speakerscreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': EventScreen(),
      'title': 'Event',
    },
    {
      'page': SpeakerScreen(),
      'title': 'Speaker',
    },
    {
      'page': SessionScreen(),
      'title': 'Session',
    },
    {
      'page': SponserScreen(),
      'title': 'Sponser',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(fontFamily: 'Cairo-Regular'),
        ),
      ),
      drawer: menu(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple[200],
        selectedLabelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: ('Event'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: ('Speaker'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: ('Session'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: ('Sponser'),
          ),
        ],
      ),
    );
  }

  Widget menu() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
          // UserAccountsDrawerHeader(
          //   accountName: Text('Roberto Aleydon'),
          //   accountEmail: Text('aleydon@gmail.com'),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: ExactAssetImage('assets/aleydon.jpg'),
          //   ),
          //   otherAccountsPictures: <Widget>[
          //     CircleAvatar(
          //       child: Text('A'),
          //       backgroundColor: Colors.white60,
          //     ),
          //     CircleAvatar(
          //       child: Text('R'),
          //     ),
          //   ],
          //   onDetailsPressed: () {},
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("assets/fundo.jpg"), fit: BoxFit.cover)),
          // ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(fontFamily: 'Cairo-Regular'),
            ),
            leading: Icon(Icons.person),
            onLongPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(fontFamily: 'Cairo-Regular'),
            ),
            leading: Icon(Icons.settings),
            onLongPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StaticScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
              title: Text(
                'Close',
                style: TextStyle(fontFamily: 'Cairo-Regular'),
              ),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              }),
          Divider(),
          ListTile(
              title: Text(
                'LOGOUT',
                style: TextStyle(fontFamily: 'Cairo-Regular'),
              ),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              }),
        ]),
      ),
    );
  }
}
