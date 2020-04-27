import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
                CustomText(text: 'Welcome back,',size: ScreenUtil().setSp(60),),
                CustomText(text: 'What did you catch ?',size: ScreenUtil().setSp(35),bold: false,),
                Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                          child: Image.asset('images/homeButterfly.png'),
                        ),
                        CustomText(text: 'Insect',size: ScreenUtil().setSp(30),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                          child: Image.asset('images/homeFish.png'),
                        ),
                        CustomText(text: 'Fish',size: ScreenUtil().setSp(30),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                          child: Image.asset('images/homeFossil.png'),
                        ),
                        CustomText(text: 'Fossil',size: ScreenUtil().setSp(30),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(50),),
                CustomText(text: 'Overall Progress',size: ScreenUtil().setSp(60),),
                Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeButterfly.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeOwl.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeNet.png'),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeFish.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeOwl.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeHook.png'),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeFossil.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeOwl.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '12/80',size: ScreenUtil().setSp(35),),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeShovel.png'),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeHouse.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '400,000 Remaining',size: ScreenUtil().setSp(35),),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeRamp.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '0 Remaining',size: ScreenUtil().setSp(35),),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(130),),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('images/homeBridge.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40),),
                    CustomText(text: '0 Remaining',size: ScreenUtil().setSp(35),),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
