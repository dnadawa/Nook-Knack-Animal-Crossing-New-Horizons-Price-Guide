import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'main.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),() {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => MyApp()),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff50BAB0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/splash.gif'),
          Text('Nook Knack',style: GoogleFonts.varelaRound(
            textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36)),
          ),
        ],
      ),
    );
  }
}

