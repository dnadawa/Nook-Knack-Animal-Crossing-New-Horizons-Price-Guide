import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';


class Checklist extends StatelessWidget {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: ScreenUtil().setHeight(30),),
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){Navigator.pop(context);}),
                    CustomText(text: 'Quick Reference Guide',size: ScreenUtil().setSp(45),)
                  ],
                ),
                ExpansionTile(
                  title: CustomText(text: 'Daily Checklist',size: ScreenUtil().setSp(40),),
                  backgroundColor: Colors.transparent,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff75CBB5),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setHeight(40),
                      child: Image.asset('images/list.png'),
                    ),
                  ),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        CustomText(text: 'Check mail',)
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        CustomText(text: 'Check Nook+ tasks',)
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: ScreenUtil().setWidth(145),endIndent: ScreenUtil().setWidth(30),),
                ExpansionTile(
                  title: CustomText(text: 'Weekly Turnip Purchase Price',size: ScreenUtil().setSp(40),),
                  backgroundColor: Colors.transparent,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff75CBB5),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setHeight(40),
                      child: Image.asset('images/turnip.png'),
                    ),
                  ),
                  children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: ScreenUtil().setWidth(145),),
                          Container(
                              width: ScreenUtil().setWidth(150),
                              child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,)),
                          CustomText(text: 'Bells',)
                        ],
                      )
                  ],
                ),
                Divider(thickness: 2,indent: ScreenUtil().setWidth(145),endIndent: ScreenUtil().setWidth(30),),
                ExpansionTile(
                  title: CustomText(text: 'Remaining Loan Balances',size: ScreenUtil().setSp(40),),
                  backgroundColor: Colors.transparent,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff75CBB5),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setHeight(40),
                      child: Image.asset('images/bag.png'),
                    ),
                  ),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          child: Image.asset('images/homeHouse.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(30),),
                        Container(
                            width: ScreenUtil().setWidth(200),
                            child: InputField(hint: '1,200,000',isChecklist: true,type: TextInputType.number,)),
                        CustomText(text: 'Bells',)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          child: Image.asset('images/homeRamp.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(30),),
                        Container(
                            width: ScreenUtil().setWidth(200),
                            child: InputField(hint: '1,200,000',isChecklist: true,type: TextInputType.number,)),
                        CustomText(text: 'Bells',)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          child: Image.asset('images/homeBridge.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(30),),
                        Container(
                            width: ScreenUtil().setWidth(200),
                            child: InputField(hint: '1,200,000',isChecklist: true,type: TextInputType.number,)),
                        CustomText(text: 'Bells',)
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: ScreenUtil().setWidth(145),endIndent: ScreenUtil().setWidth(30),),
                ExpansionTile(
                  title: CustomText(text: 'Fruit Tracker',size: ScreenUtil().setSp(40),),
                  backgroundColor: Colors.transparent,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff75CBB5),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setHeight(40),
                      child: Image.asset('images/fruit.png'),
                    ),
                  ),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/apple.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/cherry.png',fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/orange.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/peach.png',fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/coconut.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          child: Image.asset('images/pear.png',fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: ScreenUtil().setWidth(145),endIndent: ScreenUtil().setWidth(30),),
                ExpansionTile(
                  title: CustomText(text: 'Hybrid Flower Combos',size: ScreenUtil().setSp(40),),
                  backgroundColor: Colors.transparent,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff75CBB5),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setHeight(40),
                      child: Image.asset('images/flower.png'),
                    ),
                  ),
                  children: <Widget>[
                    CustomText(text: 'Lillies',size: ScreenUtil().setSp(35),),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(80),
                          child: Image.asset('images/row1.png',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(80),
                          child: Image.asset('images/row2.png',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(80),
                          child: Image.asset('images/row3.png',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),


                    CustomText(text: 'Roses',size: ScreenUtil().setSp(35),),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(80),
                          child: Image.asset('images/roses1.png',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(80),
                          child: Image.asset('images/roses2.png',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),
                        CircleAvatar(
                          backgroundColor: Color(0xffEFE8BD),
                          radius: ScreenUtil().setWidth(22),
                          child: Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),),
                        ),
                      ],
                    ),
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
