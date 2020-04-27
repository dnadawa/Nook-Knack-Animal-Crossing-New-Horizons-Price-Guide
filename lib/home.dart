import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/sign-up.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';
import 'package:nookknack/widgets/toast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/logback.png'),fit: BoxFit.fill)
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(150),
                    height: ScreenUtil().setHeight(150),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('images/logo.png')),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(50),),
                  CustomText(text: 'Nook Knack',size: ScreenUtil().setSp(70),),
                  CustomText(text: 'Catch it. Sell it. Track it.',size: ScreenUtil().setSp(35),),
                  SizedBox(height: ScreenUtil().setHeight(50),),
                  CustomText(text: 'Log into your account',size: ScreenUtil().setSp(55),),

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
