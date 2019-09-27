import 'dart:io';
import 'package:epidemyacaps/devdrawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import './home.dart';
import 'loader.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

final FirebaseAuth mAuth = FirebaseAuth.instance;
bool isLoggedIn = false;
double radius = 0;

class Login extends StatefulWidget {
  final Widget child;

  Login({Key key, this.child}) : super(key: key);

  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Invalid Login'),
            content: new Text('Please check your Username or Password.'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Try Agian'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showLoader() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Loader();
        });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Exit app now?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () => exit(0),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('ePidemya'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }),
          ],
        ),
        drawer: DevDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/LogoTest.png',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: "admin@prvy.com",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                        )),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: () {
                        /* 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loader()),
                        ); */
                        //_showLoader();
                        CircularProgressIndicator();
                        signInWithEmailPassword();
                        //_showLoader();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.grey,
                        color: Colors.blue,
                        elevation: 5.0,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }

  // TODO: Fix firebase Authentication = Checked!

  void signInWithEmailPassword() async {
    FirebaseUser user;
    try {
      user = (await mAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      
      // INFO: This is to set account details both in Authentication and Cloud Storage ---------!
      
      /* UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = _emailController.text;
      user.updateProfile(userUpdateInfo).then((onValue) {
        Firestore.instance.collection('users').document().setData({
          'email': _emailController.text,
          'firstname': _emailController.text
        }).then((onValue) {
          print('complete');
        });
      }); */
    } catch (e) {
      _showDialog();
      _passwordController.clear();
      _emailController.clear();
      print(e.toString());
    } finally {
      if (user != null) {
        isLoggedIn = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        print('Sign In Complete');
      }
    }
  }
}
