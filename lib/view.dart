import 'dart:async';
import 'package:intl/intl.dart';
import 'package:epidemyacaps/desc.dart';
import 'package:epidemyacaps/devdrawer.dart';
import 'package:flutter/material.dart';
import 'package:epidemyacaps/list.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';

import './home.dart';


// TODO: NOTE! this page cannot be rendered when its first launch. but once the data from firebase was downloaded, if you hot reload the app. it will display

class ViewList extends StatefulWidget {
  final Widget child;

  ViewList({Key key, this.child}) : super(key: key);

  _ViewList createState() => _ViewList();
}

List _sort = ['Weekly', 'Monthly', 'Yearly'];
QuerySnapshot querySnapshot;
List<DropdownMenuItem<String>> _dropDownSortItems;
String _currentSort;

class _ViewList extends State<ViewList> {
  int test = 4;
  int count2019 = 0;
  int count2018 = 0;
  int count2017 = 0;
  Color barColor = Colors.transparent;
  Map<String, Record> data;
  var forSort = new List();
  final timeNow = new DateTime.now();
  var dateFormat = new DateFormat("MMM");

  //Eto yung working graph but static only
  /* _generateData() {
    chartData = [
      Record('April', 'Brgy. 662', count, Colors.yellow),
      Record('May', 'Brgy. 802', 4, Colors.orangeAccent),
      Record('June', 'Brgy. 662', 7, Colors.red),
      Record('July', 'Brgy. 462', 12, Colors.red),
      Record('Aug', 'Brgy. 461', 5, Colors.orangeAccent),
      Record('Sept', 'Brgy. 464', 1, Colors.yellow),
    ];
    _seriesRecordData.add(
      charts.Series(
        data: chartData,
        domainFn: (Record record, _) => record.month,
        measureFn: (Record record, _) => record.recordValue,
        colorFn: (Record record, _) =>
            charts.ColorUtil.fromDartColor(record.colorval),
        id: 'Monthly Record',
        labelAccessorFn: (Record row, _) => '${row.record}',
      ),
    );
  } */
  //Timer timer = new Timer();

  @override
  void initState() {
    getData().then((results) {
      querySnapshot = results;
    });
    data = {
      /* 
      'April': Record('April', 'Brgy. 662', count, Colors.yellow),
      'May': Record('May', 'Brgy. 802', 4, Colors.orangeAccent),
      'June': Record('June', 'Brgy. 662', 7, Colors.red),
      'July': Record('July', 'Brgy. 462', 12, Colors.red),
      'Aug': Record('Aug', 'Brgy. 461', 5, Colors.orangeAccent),
      'Sept': Record('Sept', 'Brgy. 464', 1, Colors.yellow), */
    };
    _dropDownSortItems = getDropDownSortItems();
    _currentSort = _dropDownSortItems[2].value;
    changedSortItem('Yearly');
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownSortItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String sort in _sort) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: sort, child: new Text(sort)));
    }
    return items;
  }

  

  void changedSortItem(String selectedSort) {
    print("Sort Selected $selectedSort, we are going to refresh the UI");
    setState(() {
      _currentSort = selectedSort;
      // count = querySnapshot.documents.length;
      // TODO: fixed sorting issue.
      /* for (int i=0; i<=count; i++) {
        dorValue = querySnapshot.documents[i].data['dor'];
      } */
      forSort.clear();
      count2017 = 0;
      count2018 = 0;
      count2019 = 0;
      String checkTime = timeNow.year.toString();
      // print(dorValue);
      // print(dorValue.contains('2019').toString().length);
      // print(dorValue.contains('2019').toString());
      data.clear();
      if (_currentSort == 'Weekly') {
        data.putIfAbsent(
            'test', () => Record('test', 'test barangay', 5, Colors.orange));
        data.putIfAbsent(
            'test2', () => Record('test2', 'test 2', 10, Colors.red));
      } else if (_currentSort == 'Monthly') {
        for (var item in querySnapshot.documents) {
          if (timeNow.month < 10) {
            checkTime = "0" + timeNow.month.toString();
          }
          if (item.data['dor'].toString().substring(5, 7) == '09' &&
              item.data['disease'].toString() == selectedDisease) {
            forSort.add(item.data['dor'].toString());
            print(dateFormat.format(DateFormat('yyyy-MM-dd hh:mm aaa').parse(item.data['dor'].toString())));
          }
        }
        count2017 = forSort.toList().length;
        forSort.clear();
        print(DateFormat.MMMM('en_US').format(timeNow));
        print("2017-$count2017");

        if (count2017 <= 4) {
          barColor = Colors.yellow;
        } else if (count2017 > 4 && count2017 <= 8) {
          barColor = Colors.orange;
        } else if (count2017 > 8) {
          barColor = Colors.red;
        }
        data.putIfAbsent(
            DateFormat.MMMM('en_US').format(timeNow), () => Record(DateFormat.MMMM('en_US').format(timeNow), 'test barangay', count2017, barColor));
      } else if (_currentSort == 'Yearly') {
        for (var item in querySnapshot.documents) {
          if (item.data['dor'].toString().substring(0, 4) == '2017' &&
              item.data['disease'].toString() == selectedDisease) {
            forSort.add(item.data['dor'].toString());
          }
        }
        count2017 = forSort.toList().length;
        forSort.clear();
        print("2017-$count2017");

        for (var item in querySnapshot.documents) {
          if (item.data['dor'].toString().substring(0, 4) == '2018' &&
              item.data['disease'].toString() == selectedDisease) {
            forSort.add(item.data['dor'].toString());
          }
        }
        count2018 = forSort.toList().length;
        forSort.clear();
        print("2018-$count2018");

        for (var item in querySnapshot.documents) {
          if (item.data['dor'].toString().substring(0, 4) == '2019' &&
              item.data['disease'].toString() == selectedDisease) {
            forSort.add(item.data['dor'].toString());
          }
        }
        count2019 = forSort.toList().length;
        forSort.clear();
        print("2019-$count2019");

        // dorValue = item.data['dor'];
        // diseaseValue = item.data['disease'];
        //print(dorValue.substring(5, 7));
        //print(dorValue.compareTo('2019'));

        if (count2017 <= 4) {
          barColor = Colors.yellow;
        } else if (count2017 > 4 && count2017 <= 8) {
          barColor = Colors.orange;
        } else if (count2017 > 8) {
          barColor = Colors.red;
        }
        data.putIfAbsent(
            '2017', () => Record('2017', 'test barangay', count2017, barColor));

        if (count2018 <= 4) {
          barColor = Colors.yellow;
        } else if (count2018 > 4 && count2018 <= 8) {
          barColor = Colors.orange;
        } else if (count2018 > 8) {
          barColor = Colors.red;
        }
        data.putIfAbsent(
            '2018', () => Record('2018', 'test barangay', count2018, barColor));

        if (count2019 <= 4) {
          barColor = Colors.yellow;
        } else if (count2019 > 4 && count2019 <= 8) {
          barColor = Colors.orange;
        } else if (count2019 > 8) {
          barColor = Colors.red;
        }
        data.putIfAbsent(
            '2019', () => Record('2019', 'test barangay', count2019, barColor));

        // print("2017 - $count2017 2018 - $count2018 2019 - $count2019");
        // print("this one " + forSort.toList().length.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /* if (querySnapshot != null) {
      test = querySnapshot.documents[1].data['zone'];
    } */

    //eto ung testing para sa update ng graph.

    var _seriesRecordData = [
      new charts.Series(
        data: data.values.toList(),
        domainFn: (Record record, _) => record.month,
        measureFn: (Record record, _) => record.recordValue,
        colorFn: (Record record, _) =>
            charts.ColorUtil.fromDartColor(record.colorval),
        id: 'Monthly Record',
        labelAccessorFn: (Record row, _) => '${row.record}',
      )
    ];

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('E-List'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.map,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                })
          ],
        ),

        // Drawer nav
        drawer: DevDrawer(),
        body: Container(
          padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: DisplaySelected(),
                ),
                Stack(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Select View: ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton(
                          value: _currentSort,
                          items: _dropDownSortItems,
                          onChanged: changedSortItem,
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: new charts.BarChart(
                    _seriesRecordData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    behaviors: [
                      /* new charts.DatumLegend(
                            outsideJustification:
                                charts.OutsideJustification.endDrawArea,
                            horizontalFirst: true,
                            desiredMaxRows: 1,
                            cellPadding:
                                new EdgeInsets.only(right: 4, bottom: 4),
                            entryTextStyle: charts.TextStyleSpec(
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 10),
                          ), */
                    ],
                  ),
                ),
              ]),
        ));
  }

  getData() async {
    return await Firestore.instance.collection('testCrud').getDocuments();
  }
}

class Record {
  final String month;
  final String record;
  int recordValue;
  final Color colorval;

  Record(this.month, this.record, this.recordValue, this.colorval);

  setRecort() {
    recordValue = querySnapshot.documents.length;
  }
}
