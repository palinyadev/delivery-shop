

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/auth/auth_screen.dart';
import './screens/home/home_screen.dart';

import 'package:provider/provider.dart';
import './providers/users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final InputBorder? underlineStyle = UnderlineInputBorder(
      borderSide: BorderSide(width: 0.4, color: Colors.grey.shade400));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Users())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen()
        },
        theme: ThemeData(
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: Colors.grey.shade100,
            appBarTheme: AppBarTheme(
              color: Colors.grey.shade200,
              centerTitle: true,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              elevation: 0.5,
              iconTheme: const IconThemeData.fallback(),
            ),
            cardTheme: CardTheme(
                elevation: 0.4,
                color: Colors.white,
                shadowColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: Colors.grey.shade400,
                  padding: const EdgeInsets.all(0),
                  minimumSize:const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 53),
                  shadowColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: const TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: underlineStyle,
              errorBorder: underlineStyle,
              focusedErrorBorder: underlineStyle,
              enabledBorder: underlineStyle,
              disabledBorder: underlineStyle,
            )),
      ),
    );
  }
}
