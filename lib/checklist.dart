import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/checklist-item.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  TextEditingController turnip = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController ramp = TextEditingController();
  TextEditingController bridge = TextEditingController();
  List<DocumentSnapshot> paperlist;
  StreamSubscription<QuerySnapshot> subscription;
  String email;

  bool apple = false;
  bool cherry= false;
  bool orange= false;
  bool peach= false;
  bool coconut= false;
  bool pear= false;


  bool lilly1 = false;
  bool lilly2 = false;
  bool lilly3 = false;
  bool rose1 = false;
  bool rose2 = false;

  bool list1 = false;
  bool list2 = false;
  bool list3 = false;
  bool list4 = false;
  bool list5 = false;
  bool list6 = false;
  bool list7 = false;
  bool list8 = false;
  bool list9 = false;
  bool list10 = false;
  bool list11 = false;
  bool list12 = false;
  bool list13 = false;
  bool list14 = false;
  bool list15 = false;
  bool list16 = false;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
//    var sub = await Firestore.instance.collection('users').where('email',isEqualTo: email).getDocuments();
//    var list = sub.documents;
    setState(() {
        turnip.text = paperlist[0]['turnip'].toString();
        house.text = paperlist[0]['house'].toString();
        ramp.text = paperlist[0]['ramp'].toString();
        bridge.text = paperlist[0]['bridge'].toString();

        apple = paperlist[0]['apple'];
        cherry = paperlist[0]['cherry'];
        orange = paperlist[0]['orange'];
        peach = paperlist[0]['peach'];
        coconut = paperlist[0]['coconut'];
        pear = paperlist[0]['pear'];

        lilly1 = paperlist[0]['lilly1'];
        lilly2 = paperlist[0]['lilly2'];
        lilly3 = paperlist[0]['lilly3'];
        rose1 = paperlist[0]['rose1'];
        rose2 = paperlist[0]['rose2'];

        list1 = paperlist[0]['list1'];
        list2 = paperlist[0]['list2'];
        list3 = paperlist[0]['list3'];
        list4 = paperlist[0]['list4'];
        list5 = paperlist[0]['list5'];
        list6 = paperlist[0]['list6'];
        list7 = paperlist[0]['list7'];
        list8 = paperlist[0]['list8'];
        list9 = paperlist[0]['list9'];
        list10 = paperlist[0]['list10'];
        list11 = paperlist[0]['list11'];
        list12 = paperlist[0]['list12'];
        list13 = paperlist[0]['list13'];
        list14 = paperlist[0]['list14'];
        list15 = paperlist[0]['list15'];
        list16 = paperlist[0]['list16'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = Firestore.instance.collection('users').where('email',isEqualTo: email).snapshots().listen((datasnapshot){
      setState(() {
        paperlist = datasnapshot.documents;
      });
    });
    getData();
  }
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
//                    Row(
//                      children: <Widget>[
//                        SizedBox(width: ScreenUtil().setWidth(50),),
//                        GestureDetector(
//                          onTap: () async {
//                            await Firestore.instance.collection('users').document(email).updateData({
//                              'list1': !list1
//                            });
//                            getData();
//                          },
//                          child: CircleAvatar(
//                            backgroundColor: Color(0xffEFE8BD),
//                            radius: ScreenUtil().setWidth(22),
//                            child: list1?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
//                          ),
//                        ),
//                        SizedBox(width: ScreenUtil().setWidth(40),),
//                        CustomText(text: 'Check mail',)
//                      ],
//                    ),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list1': !list1
                        });
                        getData();
                      },
                      name: 'Check Mail',
                      list: list1,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list2': !list2
                        });
                        getData();
                      },
                      name: 'Check Nook+ tasks',
                      list: list2,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list3': !list3
                        });
                        getData();
                      },
                      name: 'Water flowers',
                      list: list3,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list4': !list4
                        });
                        getData();
                      },
                      name: 'Dig up fossils',
                      list: list4,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list5': !list5
                        });
                        getData();
                      },
                      name: 'Check campsite',
                      list: list5,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list6': !list6
                        });
                        getData();
                      },
                      name: 'Check beach for seashells',
                      list: list6,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list7': !list7
                        });
                        getData();
                      },
                      name: 'Check beach for Gulliver',
                      list: list7,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list8': !list8
                        });
                        getData();
                      },
                      name: 'Plant money tree',
                      list: list8,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list9': !list9
                        });
                        getData();
                      },
                      name: 'Collect fruit',
                      list: list9,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list10': !list10
                        });
                        getData();
                      },
                      name: 'Hit all rocks',
                      list: list10,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list11': !list11
                        });
                        getData();
                      },
                      name: 'Find Bell rock',
                      list: list11,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list12': !list12
                        });
                        getData();
                      },
                      name: 'Find glowing spot and dig for Bells',
                      list: list12,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list13': !list13
                        });
                        getData();
                      },
                      name: 'Check plaza and island for visitors',
                      list: list13,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list14': !list14
                        });
                        getData();
                      },
                      name: 'Remove clumps of weeds',
                      list: list14,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list15': !list15
                        });
                        getData();
                      },
                      name: 'Check Nook Special Items',
                      list: list15,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    ChecklistItem(
                      onTap: () async {
                        await Firestore.instance.collection('users').document(email).updateData({
                          'list16': !list16
                        });
                        getData();
                      },
                      name: 'Check Turnip sell prices (AM+PM)',
                      list: list16,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),

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
                              width: ScreenUtil().setWidth(220),
                              child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: turnip,
                              onSubmit: (x) async {
                                await Firestore.instance.collection('users').document(email).updateData({
                                  'turnip': x
                                });
                                getData();
                              },
                              )),
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
                            child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: house,
                              onSubmit: (x) async {
                                await Firestore.instance.collection('users').document(email).updateData({
                                  'house': x
                                });
                                getData();
                              },)),
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
                            child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: ramp,
                              onSubmit: (x) async {
                                await Firestore.instance.collection('users').document(email).updateData({
                                  'ramp': x
                                });
                                getData();
                              },)),
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
                            child: InputField(hint: '0',isChecklist: true,type: TextInputType.number,controller: bridge,
                              onSubmit: (x) async {
                                await Firestore.instance.collection('users').document(email).updateData({
                                  'bridge': x
                                });
                                getData();
                              },)),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'apple': !apple
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: apple?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
                          child: Image.asset('images/apple.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'cherry': !cherry
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: cherry?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
                          child: Image.asset('images/cherry.png',fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'orange': !orange
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: orange?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
                          child: Image.asset('images/orange.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'peach': !peach
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: peach?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
                          child: Image.asset('images/peach.png',fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15),),
                    Row(
                      children: <Widget>[
                        SizedBox(width: ScreenUtil().setWidth(145),),
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'coconut': !coconut
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: coconut?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
                          child: Image.asset('images/coconut.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50),),

                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'pear': !pear
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: pear?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(20),),
                        SizedBox(
                          width: ScreenUtil().setWidth(75),
                          height: ScreenUtil().setHeight(75),
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
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'lilly1': !lilly1
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: lilly1?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
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
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'lilly2': !lilly2
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: lilly2?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
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
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'lilly3': !lilly3
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: lilly3?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
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
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'rose1': !rose1
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: rose1?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
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
                        GestureDetector(
                          onTap: () async {
                            await Firestore.instance.collection('users').document(email).updateData({
                              'rose2': !rose2
                            });
                            getData();
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEFE8BD),
                            radius: ScreenUtil().setWidth(22),
                            child: rose2?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
                          ),
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
