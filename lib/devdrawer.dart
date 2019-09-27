import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'account.dart';
import 'list.dart';
import 'main.dart';
import 'report.dart';

class DevDrawer extends StatelessWidget {
  /* bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else
      return false;
  } */

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true) {
      return Drawer(
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
                FirebaseAuth.instance.signOut();
                isLoggedIn = false;
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
      );
    } else {
      return Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(
                'Welcome to',
                style: TextStyle(color: Colors.black45),
              ),
              accountEmail: Text(
                'ePidemya',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: new BoxDecoration(color: Colors.lightBlueAccent),
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
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: ListTile(
                title: Text('Login'),
                leading: Icon(Icons.perm_identity, color: Colors.cyan),
              ),
            ),
          ],
        ),
      );
    }
  }
}
