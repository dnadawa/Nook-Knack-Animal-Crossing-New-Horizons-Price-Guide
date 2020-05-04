import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/checklist.dart';
import 'package:nookknack/fossil.dart';
import 'package:nookknack/insects.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/settings.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fish.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int donatedFishCount;
  int caughtFishCount;
  int caughtInsectCount;
  int donatedInsectCount;
  int donatedFossilCount;
  int caughtFossilCount;
  var fishList;
  var insectList;
  var fossilList;
  String email;
  TextEditingController houseController = TextEditingController();
  TextEditingController rampController = TextEditingController();
  TextEditingController bridgeController = TextEditingController();

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    var sub = await Firestore.instance.collection('users').where('email',isEqualTo: email).getDocuments();
    var list = sub.documents;

    var fishSub = await Firestore.instance.collection('all').where('type',isEqualTo:'fish').getDocuments();
    fishList = fishSub.documents;

    var insectSub = await Firestore.instance.collection('test').where('type', isEqualTo: 'insect').getDocuments();
    insectList = insectSub.documents;

    var fossilSub = await Firestore.instance.collection('all').where('type', isEqualTo: 'fossil').getDocuments();
    fossilList = fossilSub.documents;

    donatedFishCount = 0;
    caughtFishCount = 0;
    donatedInsectCount = 0;
    caughtInsectCount = 0;
    donatedFossilCount=0;
    caughtFossilCount=0;
    for(int i=0;i<fishList.length;i++){
      List donated = fishList[i]['donated'];
      List caught = fishList[i]['caught'];
      if(donated.contains(email)){
        donatedFishCount++;
      }
      if(caught.contains(email)){
        caughtFishCount++;
      }
    }

    for(int i=0;i<insectList.length;i++){
      List donated = insectList[i]['donated'];
      List caught = insectList[i]['caught'];
      if(donated.contains(email)){
        donatedInsectCount++;
      }
      if(caught.contains(email)){
        caughtInsectCount++;
      }
    }

    for(int i=0;i<fossilList.length;i++){
      List donated = fossilList[i]['donated'];
      List caught = fossilList[i]['caught'];
      if(donated.contains(email)){
        donatedFossilCount++;
      }
      if(caught.contains(email)){
        caughtFossilCount++;
      }
    }

    setState(() {
      houseController.text = list[0]['house'].toString();
      rampController.text = list[0]['ramp'].toString();
      bridgeController.text = list[0]['bridge'].toString();
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
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/homeback.png'),fit: BoxFit.fill)
          ),
          child: Stack(
            children: <Widget>[
              fishList!=null?SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setHeight(50),),
                    SizedBox(
                      width: ScreenUtil().setWidth(150),
                      height: ScreenUtil().setHeight(150),
                      child: Image.asset('images/logo.png'),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    CustomText(text: 'Nook Knack',size: ScreenUtil().setSp(80),),
                    CustomText(text: 'Catch it. Sell it. Track it.',size: ScreenUtil().setSp(35),bold: false,),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    CustomText(text: 'Welcome back,',size: ScreenUtil().setSp(50),),
                    CustomText(text: 'What did you find?',size: ScreenUtil().setSp(35),bold: false,),
                    Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MyCustomRoute(builder: (context) => Insects()),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                              child: Image.asset('images/homeButterfly.png'),
                            ),
                            CustomText(text: 'Insect',size: ScreenUtil().setSp(30),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MyCustomRoute(builder: (context) => Fish()),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                              child: Image.asset('images/homeFish.png'),
                            ),
                            CustomText(text: 'Fish',size: ScreenUtil().setSp(30),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MyCustomRoute(builder: (context) => Fossils()),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                              child: Image.asset('images/homeFossil.png'),
                            ),
                            CustomText(text: 'Fossil',size: ScreenUtil().setSp(30),),
                          ],
                        ),
                      ),
                    ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    CustomText(text: 'Overall Progress',size: ScreenUtil().setSp(50),),
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
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$donatedInsectCount/${insectList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          child: Image.asset('images/homeOwl.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$caughtInsectCount/${insectList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
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
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$donatedFishCount/${fishList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          child: Image.asset('images/homeOwl.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$caughtFishCount/${fishList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
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
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$donatedFossilCount/${fossilList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          child: Image.asset('images/homeOwl.png'),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        SizedBox(
                            width: ScreenUtil().setWidth(105),
                            child: CustomText(text: '$caughtFossilCount/${fossilList.length}',size: ScreenUtil().setSp(35),align: TextAlign.end,)),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          child: Image.asset('images/homeShovel.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10),),
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
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(80),
                          child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: houseController,
                            onSubmit: (x) async {
                              await Firestore.instance.collection('users').document(email).updateData({
                                'house': x
                              });
                              getData();
                            },),
                        ),
                        CustomText(text: 'Remaining',size: ScreenUtil().setSp(35),),
                      ],
                    ),
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
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(80),
                          child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: rampController,
                            onSubmit: (x) async {
                              await Firestore.instance.collection('users').document(email).updateData({
                                'ramp': x
                              });
                              getData();
                            },),
                        ),
                        CustomText(text: 'Remaining',size: ScreenUtil().setSp(35),),
                      ],
                    ),
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
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(80),
                          child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: bridgeController,
                            onSubmit: (x) async {
                              await Firestore.instance.collection('users').document(email).updateData({
                                'bridge': x
                              });
                              getData();
                            },),
                        ),
                        CustomText(text: 'Remaining',size: ScreenUtil().setSp(35),),
                      ],
                    ),
                  ],
                ),
              ):Center(child: CircularProgressIndicator(),),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MyCustomRoute(builder: (context) => Settings()),
                            );
                          },
                          child: SizedBox(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(50),
                            child: Image.asset('images/settings.png'),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(40),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MyCustomRoute(builder: (context) => Checklist()),
                            );
                          },
                          child: SizedBox(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(50),
                            child: Image.asset('images/list.png'),
                          ),
                        )
                      ],
                    ),
                  )),

            ],
          ),

        ),
      ),
    );
  }
}
