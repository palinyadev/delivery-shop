import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../providers/users.dart';
import '../../widgets/drawer/drawer_app.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {

  static const routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late StreamSubscription userListenner;

void initUser(){

userListenner = FirebaseAuth.instance.authStateChanges().listen((user) async{
  
  if(user != null){
    await Provider.of<Users>(context,listen: false).getUserInfo();
  }
});

}

  @override
  void initState() {
    
    super.initState();
    initUser();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home"),
      ),
      drawer: DrawerApp(),
      body: Container(),
    );
  }
}