import 'package:epidemyacaps/devdrawer.dart';
import 'package:epidemyacaps/devscaffold.dart';
import 'package:flutter/material.dart';

import './main.dart';
import './list.dart';
import './report.dart';
import './account.dart';
import './map.dart';

class HomePage extends StatelessWidget {
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
      drawer: DevDrawer(),
      body: Stack(
        children: <Widget>[
          // TODO: Integrate google maps = Checked!
          Container(child: ViewMap()),
          DevScaffold()
        ],
      ),
    );
  }
}
