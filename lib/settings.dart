import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/custom-text.dart';


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/homeback.png'),fit: BoxFit.fill)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                      child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
                        Navigator.pop(context);
                      }),
                    )),
                SizedBox(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(150),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('images/logo.png')),
                ),
                SizedBox(height: ScreenUtil().setHeight(50),),
                CustomText(text: 'Nook Knack',size: ScreenUtil().setSp(70),),
                CustomText(text: 'Catch it. Sell it. Track it.',size: ScreenUtil().setSp(35),bold: false,),
                SizedBox(height: ScreenUtil().setHeight(50),),
                CustomText(text: 'Settings',size: ScreenUtil().setSp(60),),
                CustomText(text: 'What did you need ?',size: ScreenUtil().setSp(35),bold: false,),
                Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: 30,),
                CustomText(text: 'Hemisphere?',size: ScreenUtil().setSp(45)),
                SizedBox(height: ScreenUtil().setHeight(40),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal :ScreenUtil().setWidth(50)),
                  child: Button(text: 'Northern',color: Color(0xff75CBB5),onclick: (){},isBorder: false,),
                ),
                SizedBox(height: ScreenUtil().setHeight(30),),
                CustomText(text: 'OR',size: ScreenUtil().setSp(40),),
                SizedBox(height: ScreenUtil().setHeight(30),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                  child: Button(text: 'Northern',color: Colors.transparent,onclick: (){}),
                ),
                SizedBox(height: ScreenUtil().setHeight(70),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                  child: Button(text: 'Reset all data',color: Colors.transparent,onclick: (){}),
                ),
                SizedBox(height: ScreenUtil().setHeight(30),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                  child: Button(text: 'Logout',color: Colors.transparent,onclick: (){}),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
