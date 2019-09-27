import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else
      return false;
  }

  Future<void> addData(reportData) async {
    if (isLoggedIn()) {
      Firestore.instance
          .collection('testCrud')
          .add(reportData)
          .catchError((e) {
            print(e);
          });
          print('submit success');
    }
    else 
    print('Something went wrong.');
  }
}
