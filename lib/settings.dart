import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/home.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/sign-in.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color nColor;
  Color sColor;
  bool nBorder;
  bool sBorder;

  getDetails() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var location = prefs.getString('location');
    if(location==null){
      setState(() {
        nColor = Color(0xff75CBB5);
        sColor = Colors.transparent;
        nBorder = false;
        sBorder = true;
      });
    }
    else if(location=='n'){
      setState(() {
        nColor = Color(0xff75CBB5);
        sColor = Colors.transparent;
        nBorder = false;
        sBorder = true;
      });
    }
    else if(location=='s'){
      setState(() {
        sColor = Color(0xff75CBB5);
        nColor = Colors.transparent;
        sBorder = false;
        nBorder = true;
      });
    }
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reset all data"),
          content: Text("Are you sure?"),
          actions: [
            FlatButton(
              child: Text("YES"),
              onPressed: () async {
                ToastBar(color: Colors.orange,text: 'Please wait...').show();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('location', 'n');
                String email = prefs.getString('email');
                CollectionReference colref = Firestore.instance.collection('test');
                var caughtsub = await colref.where('caught',arrayContains: email).getDocuments();
                var caughtlist = caughtsub.documents;

                for(int i=0;i<caughtlist.length;i++){
                  List<String> List1 = List<String>.from(caughtlist[i]['caught']);
                  List1.remove(email);
                  await colref.document(caughtlist[i].documentID).updateData({
                    'caught': List1
                  });
                }

                var donatesub = await colref.where('donated',arrayContains: email).getDocuments();
                var donatelist = donatesub.documents;

                for(int i=0;i<donatelist.length;i++){
                  List<String> List1 = List<String>.from(donatelist[i]['caught']);
                  List1.remove(email);
                  await colref.document(donatelist[i].documentID).updateData({
                    'donated': List1
                  });
                }

                await Firestore.instance.collection('users').document(email).updateData({
                  'house': '0',
                  'ramp': '0',
                  'bridge': '0',
                  'turnip': '0',
                  'apple': false,
                  'cherry': false,
                  'orange': false,
                  'peach': false,
                  'coconut': false,
                  'pear': false,
                  'lilly1': false,
                  'lilly2': false,
                  'lilly3': false,
                  'rose1': false,
                  'rose2': false,
                  'rose3': false,
                  'rose4': false,
                  'rose5': false,
                  'rose6': false,
                  'rose7': false,
                  'list1': false,
                  'list2': false,
                  'list3': false,
                  'list4': false,
                  'list5': false,
                  'list6': false,
                  'list7': false,
                  'list8': false,
                  'list9': false,
                  'list10': false,
                  'list11': false,
                  'list12': false,
                  'list13': false,
                  'list14': false,
                  'list15': false,
                  'list16': false,
                });

                ToastBar(text: 'All Done!',color: Colors.green).show();

              },
            ),
            FlatButton(
              child: Text("NO"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
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
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setHeight(50),),
                    SizedBox(
                      width: ScreenUtil().setWidth(150),
                      height: ScreenUtil().setHeight(150),
                      child: Image.asset('images/logo.png'),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    CustomText(text: 'Nook Knack',size: ScreenUtil().setSp(70),),
                    CustomText(text: 'Catch it. Sell it. Track it.',size: ScreenUtil().setSp(35),bold: false,),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    CustomText(text: 'Settings',size: ScreenUtil().setSp(60),),
                    CustomText(text: 'What did you need?',size: ScreenUtil().setSp(35),bold: false,),
                    Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: 20,),
                    CustomText(text: 'Hemisphere?',size: ScreenUtil().setSp(45)),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal :ScreenUtil().setWidth(50)),
                      child: Button(text: 'Northern',color: nColor,isBorder: nBorder,isSettings: true,onclick:() async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('location',"n");
                        getDetails();
                      },),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    CustomText(text: 'OR',size: ScreenUtil().setSp(40),),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                      child: Button(text: 'Southern',color: sColor,isBorder: sBorder,isSettings: true,onclick: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('location', 's');
                        getDetails();
                      }),
                    ),
                    Divider(color: Colors.white,thickness: 3,indent: ScreenUtil().setWidth(100),endIndent:ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(80),),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                      child: Button(text: 'Reset all data',color: Colors.transparent,isSettings: true,onclick: ()=>showAlertDialog(context)),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(50)),
                      child: Button(text: 'Logout',color: Colors.transparent,isSettings: true,onclick: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('email', null);
                        Navigator.push(
                          context,
                          MyCustomRoute(builder: (context) => SignIn()),
                        );
                      }),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                      child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
                        Navigator.push(
                          context,
                          MyCustomRoute(builder: (context) => Home()),
                        );
                      }),
                    )),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
