import 'package:flutter/material.dart';

List<Widget> drawerItem(
    {required BuildContext ctx,
    required bool isLogin,
    required String title,
    IconData? icon,
    required Function() onTap}) {
  return [
    Container(
      child: Column(
        children: [
          if (title == "Log Out" || title == "Login / Sign Up")
           const Divider(
              height: 0,
            ),
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ListTile(
              dense: true,
              focusColor: Colors.transparent,
              leading: Icon(icon, color: Theme.of(ctx).primaryColor),
              title: Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
              onTap: onTap,
              trailing: title == "Log Out" || title == "Login / Sign Up"
                  ? null
                  : const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
            ),
          ),
          if (isLogin && title != "Log Out")
           const Divider(
              height: 0,
            ),
        ],
      ),
    )
  ];
}
