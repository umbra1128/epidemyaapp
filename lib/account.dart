import 'package:epidemyacaps/devdrawer.dart';
import 'package:epidemyacaps/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';

import './main.dart';
import './list.dart';
import './report.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(''),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ],
        ),

        // Drawer nav
        drawer: DevDrawer(),

        // TODO: Finalize account detail layout
        body: Container(
          padding:
              EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0, bottom: 25.0),
              color: Colors.blue[50], //0xFF7ec1f6
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              children: <Widget>[
                Center(
                  child: Text(
                    'Account Details',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Firstname:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Michael Chester',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Middle name:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'L.',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Lastname:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Reyes',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Email:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'reyesml@students.national-u.edu.ph',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Location:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Barangay 423',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Employee ID:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      '1001',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Contact:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      '09167000713',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
