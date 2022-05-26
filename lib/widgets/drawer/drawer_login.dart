import 'package:flutter/material.dart';
import './drawer_item.dart';
import '../../providers/users.dart';
import 'package:provider/provider.dart';

class DrawerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context, listen: false);
    return Column(
      children: [
       const Spacer(),
        SafeArea(
          child: Column(
            children: [
              ...drawerItem(
                ctx: context,
                isLogin: user.login,
                title: "Log Out",
                icon: Icons.exit_to_app,
                onTap: () => user.logout(context),
                
              ),
            ],
          ),
        )
      ],
    );
  }
}
