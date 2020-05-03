import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/checklist.dart';
import 'package:nookknack/fish.dart';
import 'package:nookknack/home.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'insects.dart';


class Fossils extends StatefulWidget {
  @override
  _FossilsState createState() => _FossilsState();
}

class _FossilsState extends State<Fossils> {
  final CollectionReference collectionReference  = Firestore.instance.collection("test");
  FocusNode _focus = new FocusNode();
  var fishlist;
  var subscription;
  String price = '0';
  String infoName = 'Loading...';
  String infoImage = '';
  String infoPrice = '0';
  List<bool> select = [];
  List newNameList = [];
  List newPriceList = [];
  List newImageList = [];
  List<List> caughtList = [];
  List<List> donatedList = [];
  var index;
  bool isDonated = false;
  bool isCaught = false;
  bool isDonatedSelected = false;
  bool isCaughtSelected = false;
  String email;
  List<String> nameList = [];
  TextEditingController name = TextEditingController();
  bool isFocused = false;
  PanelController panelController = PanelController();
  List newDonated;
  List newCaught;
  int donatedCount;
  int caughtCount;
  getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    panelController.hide();
  }

  calculateCount(){
    donatedCount = 0;
    caughtCount = 0;
    for(int i=0;i<fishlist.length;i++){
      List donated = fishlist[i]['donated'];
      List caught = fishlist[i]['caught'];
      if(donated.contains(email)){
        donatedCount++;
      }
      if(caught.contains(email)){
        caughtCount++;
      }
    }
  }

  void _onFocusChange(){
    print("Focus: "+_focus.hasFocus.toString());
    setState(() {
      isFocused = _focus.hasFocus;
    });
  }

  onOwlPress(){
    if(newDonated.contains(email)){
      newDonated.remove(email);
      setState(() {
        isDonated = false;
      });
      collectionReference.document(infoName).updateData({
        'donated': newDonated
      });
    }
    else{
      newDonated.add(email);
      setState(() {
        isDonated = true;
      });
      collectionReference.document(infoName).updateData({
        'donated': newDonated
      });
    }
  }

  onCaughtPress(){
    if(newCaught.contains(email)){
      newCaught.remove(email);
      setState(() {
        isCaught = false;
      });
      collectionReference.document(infoName).updateData({
        'caught': newCaught
      });
    }
    else{
      newCaught.add(email);
      setState(() {
        isCaught = true;
      });
      collectionReference.document(infoName).updateData({
        'caught': newCaught
      });
    }
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          image: DecorationImage(image: AssetImage('images/fossilback.png'),fit: BoxFit.fill)
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(100),
                    child: Image.asset('images/handle.png'),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10),),
                  CustomText(text:infoName,size: ScreenUtil().setSp(55),bold: false,),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), ScreenUtil().setHeight(40), 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    if(newDonated.contains(email)){
                      newDonated.remove(email);
                      setState(() {
                        isDonated = false;
                      });
                      collectionReference.document(infoName).updateData({
                        'donated': newDonated
                      });
                    }
                    else{
                      newDonated.add(email);
                      setState(() {
                        isDonated = true;
                      });
                      collectionReference.document(infoName).updateData({
                        'donated': newDonated
                      });
                    }
                  },
                  child: SizedBox(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: Image.asset(isDonated?'images/owl.png':'images/owlDe.png',),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(20),),
                GestureDetector(
                  onTap: (){
                    if(newCaught.contains(email)){
                      newCaught.remove(email);
                      setState(() {
                        isCaught = false;
                      });
                      collectionReference.document(infoName).updateData({
                        'caught': newCaught
                      });
                    }
                    else{
                      newCaught.add(email);
                      setState(() {
                        isCaught = true;
                      });
                      collectionReference.document(infoName).updateData({
                        'caught': newCaught
                      });
                    }
                  },
                  child: SizedBox(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: Image.asset(isCaught?'images/shovel.png':'images/shovelDe.png',),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingPanel(){
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(370)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(image: AssetImage('images/fossilback.png'),fit: BoxFit.fill)
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(100),
                    child: Image.asset('images/handle.png'),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10),),
                  CustomText(text:infoName,size: ScreenUtil().setSp(55),bold: false,),
                  SizedBox(
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setHeight(200),
                      child: Image.network(infoImage)
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(200),),
                      CircleAvatar(
                        backgroundColor: Color(0xff75CBB5),
                        radius: 15,
                        child: SizedBox(
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                            child: Image.asset('images/infoBag.png')),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                      SizedBox(
                          child: CustomText(text: '$infoPrice Bells',size: ScreenUtil().setSp(32),)),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20),),
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(200),),
                      GestureDetector(
                        onTap: ()=>onCaughtPress(),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff75CBB5),
                          radius: 15,
                          child: SizedBox(
                              width: ScreenUtil().setWidth(40),
                              height: ScreenUtil().setHeight(40),
                              child: Image.asset(isCaught?'images/shovel.png':'images/shovelDe.png')),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                      GestureDetector(
                        onTap: ()=>onCaughtPress(),
                        child: SizedBox(
                            width: ScreenUtil().setWidth(230),
                            child: CustomText(text: isCaught?'Found':'Not Found',size: ScreenUtil().setSp(32),)),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20),),
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(200),),
                      GestureDetector(
                        onTap: ()=>onOwlPress(),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff75CBB5),
                          radius: 15,
                          child: SizedBox(
                              width: ScreenUtil().setWidth(40),
                              height: ScreenUtil().setHeight(40),
                              child: Image.asset(isDonated?'images/owl.png':'images/owlDe.png')),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                      GestureDetector(
                          onTap: ()=>onOwlPress(),
                          child: CustomText(text: isDonated?'Donated':'Not Donated',size: ScreenUtil().setSp(32),))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), ScreenUtil().setHeight(40), 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    if(newDonated.contains(email)){
                      newDonated.remove(email);
                      setState(() {
                        isDonated = false;
                      });
                      collectionReference.document(infoName).updateData({
                        'donated': newDonated
                      });
                    }
                    else{
                      newDonated.add(email);
                      setState(() {
                        isDonated = true;
                      });
                      collectionReference.document(infoName).updateData({
                        'donated': newDonated
                      });
                    }
                  },
                  child: SizedBox(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: Image.asset(isDonated?'images/owl.png':'images/owlDe.png',),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(20),),
                GestureDetector(
                  onTap: (){
                    if(newCaught.contains(email)){
                      newCaught.remove(email);
                      setState(() {
                        isCaught = false;
                      });
                      collectionReference.document(infoName).updateData({
                        'caught': newCaught
                      });
                    }
                    else{
                      newCaught.add(email);
                      setState(() {
                        isCaught = true;
                      });
                      collectionReference.document(infoName).updateData({
                        'caught': newCaught
                      });
                    }
                  },
                  child: SizedBox(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: Image.asset(isCaught?'images/shovel.png':'images/shovelDe.png',),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
    setState(() {
      _focus.addListener(_onFocusChange);
    });
    subscription = collectionReference..where('type',isEqualTo: 'fossil').orderBy('name').snapshots().listen((datasnapshot){
      setState(() {
        fishlist = datasnapshot.documents;
      });

      for(int i=0;i<fishlist.length;i++){
        select.add(false);
        nameList.add(fishlist[i].data['name']);
      }

      calculateCount();
    });
    //Timer(Duration(milliseconds: 100), (){panelController.hide();});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffffae3),
        body: SlidingUpPanel(
          controller: panelController,
          borderRadius: BorderRadius.circular(40),
          margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
          maxHeight: ScreenUtil().setHeight(1025),
          minHeight: ScreenUtil().setHeight(170),
          backdropEnabled: true,
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,10,10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MyCustomRoute(builder: (context) => Checklist()),
                          );
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: Color(0xff75CBB5),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(40),
                              height: ScreenUtil().setHeight(40),
                              child: Image.asset('images/list.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MyCustomRoute(builder: (context) => Home()),
                          );
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: Color(0xff75CBB5),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(40),
                              height: ScreenUtil().setHeight(40),
                              child: Image.asset('images/homeHouse.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        height: ScreenUtil().setHeight(75),
                        child: TextField(
                          focusNode: _focus,
                          style: TextStyle(color: Colors.white,fontSize: 20,height: 1.4),
                          controller: name,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white,fontSize: 20,height: 1.4),
                            hintText: 'Search...',
                            contentPadding: EdgeInsets.fromLTRB(10,0,0,0),
                            filled: true,
                            fillColor: Color(0xff75CBB5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(width: 0,color: Color(0xff75CBB5))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(width: 0,color: Color(0xff75CBB5))
                            ),

                          ),

                          onChanged: (x){
                            setState(() {
                              newNameList.clear();
                              newPriceList.clear();
                              newImageList.clear();
                              for(int j=0;j<nameList.length;j++){
                                if(nameList[j].contains(x[0].toUpperCase()+x.substring(1))){
                                  print('there is a match ${nameList[j]}');
//                                select[j] = true;
                                  newNameList.add(nameList[j]);
                                  newPriceList.add(fishlist[j].data['price']);
                                  newImageList.add(fishlist[j].data['image']);
                                  caughtList.add(fishlist[j].data['caught']);
                                  donatedList.add(fishlist[j].data['donated']);
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MyCustomRoute(builder: (context) => Insects()),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xfff5f7e1),
                            radius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset('images/butterflyDe.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,0,0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MyCustomRoute(builder: (context) => Fish()),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xfff5f7e1),
                            radius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset('images/fishDe.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,0,0),
                        child: GestureDetector(
                          onTap: (){},
                          child: CircleAvatar(
                            backgroundColor: Color(0xfff5f7e1),
                            radius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset('images/fossil.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: (){
                        if(!isDonatedSelected){
                          subscription = collectionReference.where('donated',arrayContains: email).where('type',isEqualTo: 'fossil').orderBy('name').snapshots().listen((datasnapshot){
                            setState(() {
                              fishlist = datasnapshot.documents;
                            });
                            for(int i=0;i<fishlist.length;i++){
                              select.add(false);
                              nameList.add(fishlist[i].data['name']);
                            }
                          });
                        }
                        else{
                          subscription = collectionReference.where('type',isEqualTo: 'fossil').orderBy('name').snapshots().listen((datasnapshot){
                            setState(() {
                              fishlist = datasnapshot.documents;
                            });
                            for(int i=0;i<fishlist.length;i++){
                              select.add(false);
                              nameList.add(fishlist[i].data['name']);
                            }
                          });
                        }
                        isDonatedSelected = !isDonatedSelected;
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(75),
                        width: ScreenUtil().setWidth(110),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xffCCBD73),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomText(text: donatedCount.toString(),size: ScreenUtil().setSp(30),bold: false,),
                            SizedBox(width: ScreenUtil().setWidth(10),),
                            SizedBox(
                                width: ScreenUtil().setWidth(30),
                                height: ScreenUtil().setHeight(30),
                                child: Image.asset('images/homeOwl.png')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: (){
                        if(!isCaughtSelected){
                          subscription = collectionReference.where('caught', arrayContains: email).where('type',isEqualTo: 'fossil').orderBy('name').snapshots().listen((datasnapshot){
                            setState(() {
                              fishlist = datasnapshot.documents;
                            });

                            for(int i=0;i<fishlist.length;i++){
                              select.add(false);
                              nameList.add(fishlist[i].data['name']);
                            }
                          });
                        }
                        else{
                          subscription = collectionReference.where('type',isEqualTo: 'fossil').orderBy('name').snapshots().listen((datasnapshot){
                            setState(() {
                              fishlist = datasnapshot.documents;
                            });

                            for(int i=0;i<fishlist.length;i++){
                              select.add(false);
                              nameList.add(fishlist[i].data['name']);
                            }
                          });
                        }
                        isCaughtSelected = !isCaughtSelected;
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(75),
                        width: ScreenUtil().setWidth(110),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xffCCBD73),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomText(text: caughtCount.toString(),size: ScreenUtil().setSp(30),bold: false,),
                            SizedBox(width: ScreenUtil().setWidth(10),),
                            SizedBox(
                                width: ScreenUtil().setWidth(30),
                                height: ScreenUtil().setHeight(30),
                                child: Image.asset('images/homeShovel.png')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(210),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffCCBD73),
                    ),
                    child: Center(
                        child: CustomText(text: '$price Bells',bold: false,size: ScreenUtil().setSp(32),)),
                  ),
                ],
              ),

              Divider(
                color: Color(0xffB6A977),
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),

              Expanded(
                child: fishlist != null?GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 16.0/9.0,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8
                  ),
                  itemCount: isFocused==false?fishlist.length:newNameList.length,
                  padding: const EdgeInsets.all(10.0),

                  itemBuilder: (context,i){
                    String url =  isFocused==false?fishlist[i].data['image']:newImageList[i];
                    String newPrice =  isFocused==false?fishlist[i].data['price']:newPriceList[i];
                    String newName =  isFocused==false?fishlist[i].data['name']:newNameList[i];
                    List donated =  isFocused==false?fishlist[i].data['donated']:donatedList[i];
                    List caught =  isFocused==false?fishlist[i].data['caught']:caughtList[i];
                    List<String> newDonatedforBanner = List<String>.from(donated);
                    List<String> newCaughtforBanner = List<String>.from(caught);
                    bool donatedForBanner;
                    bool caughtForBanner;
                    if(newDonatedforBanner.contains(email)){
                      donatedForBanner = true;
                    }else{
                      donatedForBanner = false;
                    }

                    if(newCaughtforBanner.contains(email)){
                      caughtForBanner = true;
                    }else{
                      caughtForBanner = false;
                    }


                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xff75CBB5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            newDonated = List<String>.from(donated);
                            newCaught = List<String>.from(caught);
                            if(newDonated.contains(email)){
                              isDonated = true;
                            }else{
                              isDonated = false;
                            }
                            if(newCaught.contains(email)){
                              isCaught = true;
                            }else{
                              isCaught = false;
                            }
                            for(int x=0;x<fishlist.length;x++){
                              if(x==i){
                                continue;
                              }
                              select[x] = false;
                            }

                            if(select[i]==false){
                              select[i] = true;
                              price = newPrice;
                              name.text = newName;
                              infoName = newName;
                              infoImage = url;
                              infoPrice = newPrice;
                              panelController.show();
                            }else{
                              select[i] = false;
                              name.clear();
                              price = '0';
                              panelController.hide();
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(select[i]?4:0),
                          decoration: BoxDecoration(
                            color: Color(0xffEFE8BD),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: Image.network(url,fit: BoxFit.contain,)),
                              Visibility(
                                visible: caughtForBanner,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                                    child: Container(
                                        width: ScreenUtil().setWidth(30),
                                        height: ScreenUtil().setHeight(30),
                                        //color: Colors.green,
                                        child: Center(child: Image.asset('images/bannerShovel.png',fit: BoxFit.contain,))),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: donatedForBanner,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(45)),
                                    child: Container(
                                        width: ScreenUtil().setWidth(30),
                                        height: ScreenUtil().setHeight(30),
                                        //color: Colors.green,
                                        child: Center(child: Image.asset('images/bannerOwl.png',fit: BoxFit.contain,))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ): new Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
