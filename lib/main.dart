import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nookknack/checklist.dart';
import 'package:nookknack/home.dart';
import 'package:nookknack/sign-in.dart';
import 'package:nookknack/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fish.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email;
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff9F937D));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white,
        unselectedWidgetColor: Colors.white,
        dividerColor: Colors.white,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: email==null?SignIn():Home(),
    );
  }
}
