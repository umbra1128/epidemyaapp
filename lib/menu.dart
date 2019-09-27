import 'package:epidemyacaps/account.dart';
import 'package:epidemyacaps/list.dart';
import 'package:epidemyacaps/main.dart';
import 'package:epidemyacaps/report.dart';
import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('E-Map'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      // Drawer nav
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Chester Reyes'),
              accountEmail: Text('reyesml@students.national-u.edu.ph'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.person_pin,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
              ),
              decoration: new BoxDecoration(color: Colors.lightBlueAccent),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Report()),
                );
              },
              child: ListTile(
                title: Text('Report'),
                leading: Icon(
                  Icons.add_location,
                  color: Colors.cyan,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EpidemicList()),
                );
              },
              child: ListTile(
                title: Text('Epidemic List'),
                leading: Icon(Icons.format_list_bulleted, color: Colors.cyan),
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
              },
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.account_circle, color: Colors.cyan),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.perm_identity, color: Colors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }
}