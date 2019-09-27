import 'package:epidemyacaps/devdrawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './main.dart';
import './home.dart';
import './report.dart';
import './view.dart';
import 'account.dart';

String selectedDisease;

class EpidemicList extends StatefulWidget {
  @override
  _EpidemicListState createState() => _EpidemicListState();
}

class _EpidemicListState extends State<EpidemicList> {
  void navigator() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('What to view?'),
            content: Text(
              'Select `decs` to view information\nor\nSelect `map` to view this on map',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Decs'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewList()),
                  );
                },
              ),
              FlatButton(
                child: Text('Map'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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

      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              selectedDisease = "Acute Flaccid Paralysis";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Acute Flaccid Paralysis',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Adverse Event Following Immunization (AEFI)";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Adverse Event Following Immunization (AEFI)',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Anthrax";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Anthrax',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Human Aviain Influenzas";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Human Aviain Influenzas',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Measles";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Measles',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Meningococcal Disease";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Meningococcal Disease',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Neonatal Tetanus";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Neonatal Tetanus',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Paralytic Shellfish Poisoning";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Paralytic Shellfish Poisoning',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Rabies";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Rabies',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Sever Acute Respiratory Syndrome (SARS)";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Sever Acute Respiratory Syndrome (SARS)',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Acute Bloody Diarrhea";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Acute Bloody Diarrhea',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Acute Encephalitis Syndrome";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Acute Encephalitis Syndrome',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Acute Hemorrhagic Fever Syndrome";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Acute Hemorrhagic Fever Syndrome',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Acute Viral Hepatitis";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Acute Viral Hepatitis',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Bacterial Meningitis";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Bacterial Meningitis',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Cholera";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Cholera',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Dengue";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Dengue',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Diphtheria";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Diphtheria',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Hand, Foot and Mouth Disease (HFMD)";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Hand, Foot and Mouth Disease (HFMD)',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Influenza-like illness";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Influenza-like illness',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Leptospirosis";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Leptospirosis',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Malaria";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Malaria',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Non-neonatal Tetanus";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Non-neonatal Tetanus',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Pertussis";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Pertussis',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              selectedDisease = "Typhoid and Paratyphoid Fever";
              navigator();
            },
            child: ListTile(
              title: Text(
                'Typhoid and Paratyphoid Fever',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
