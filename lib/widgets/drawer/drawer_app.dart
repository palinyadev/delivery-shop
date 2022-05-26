import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/users.dart';
import 'drawer_login.dart';
import 'drawer_logout.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final user = Provider.of<Users>(context);

    return Drawer(
      child: user.login ?
      DrawerLogin() :
      DrawerLogOut(),
      
    );
  }
}