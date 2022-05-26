import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
        children: [
         const Positioned(
                    
              child: FlutterLogo(
              size: 280,
              style: FlutterLogoStyle.horizontal,
            ),
          ),
         const Positioned(
            bottom: 90,
            child: Text(
              "Build Delivery App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              ),
              ),
          
        ],
      ),
    );
  }
}