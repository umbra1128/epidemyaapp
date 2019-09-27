import 'package:epidemyacaps/main.dart';
import 'package:flutter/material.dart';

import 'report.dart';

class DevScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 35.0),
            height: 80.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Report()),
                );
              },
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
                elevation: 5.0,
                child: Center(
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    else  {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
          ),
        ],
      );
    }
  }
}
