import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyInfo {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final String phone;
  //final bool isShop;
  final String createdAt;
  final String updatedAt;

  MyInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.phone,
    // required this.isShop,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Users with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

// get data user
  MyInfo? _currentUser;
  MyInfo? get currenUser {
    return _currentUser;
  }

//check login
  bool get login {
    return _currentUser != null ? true : false;
  }

//get data in databasefirebase

  Future<void> getUserInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    try {
      final user = await db.collection("users").doc(currentUser!.uid).get();

      if (!user.exists) {
        throw "user not found!";
      }

      //get data form database

      Map<String, dynamic> data = user.data()!;

      MyInfo? myInfo;

      myInfo = MyInfo(
        id: user.id,
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        image: data['imageUrl'],
        phone: data['phone'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
      );

      _currentUser = myInfo;
      print([_currentUser!.id, _currentUser!.firstName]);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> logout(BuildContext ctx) async {
    await auth.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
