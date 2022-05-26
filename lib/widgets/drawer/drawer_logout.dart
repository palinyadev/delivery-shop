import 'package:flutter/material.dart';

import '../../screens/auth/auth_screen.dart';
import './drawer_item.dart';
import '../../providers/users.dart';
import 'package:provider/provider.dart';

class DrawerLogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You're not login",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.visible,
              ),
              const Text(
                "Please login to your account",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
             
            ],
          ),
        ),
         SafeArea(
                child: Column(
                  children: [
                    ...drawerItem(
                      ctx: context,
                      isLogin: user.login,
                      title: "Login / Sign Up",
                      icon: Icons.person,
                      onTap: ()=>Navigator.of(context).popAndPushNamed(AuthScreen.routeName),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
