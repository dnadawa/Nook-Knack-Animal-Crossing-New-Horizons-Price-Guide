import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/checklist.dart';
import 'package:nookknack/home.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'insects.dart';


class Fish extends StatefulWidget {
  @override
  _FishState createState() => _FishState();
}

class _FishState extends State<Fish> {
  final CollectionReference collectionReference  = Firestore.instance.collection("fish");
  FocusNode _focus = new FocusNode();
  var fishlist;
  var subscription;
  String price = '0';
  List<bool> select = [];
  List newNameList = [];
  List newPriceList = [];
  List newImageList = [];
  List<String> caughtList = [];
  var index;
  List<String> nameList = [];
  TextEditingController name = TextEditingController();
  bool isFocused = false;
  Color dotButtonColor = Color(0xffB6A977);

  getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> x = prefs.getStringList('caught');
      print(x);
      if(x==null){
        caughtList = [];
      }else{
        caughtList = x;
      }
    });
  }

  void _onFocusChange(){
    print("Focus: "+_focus.hasFocus.toString());
    setState(() {
      isFocused = _focus.hasFocus;
    });
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}
                ),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        }
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
    subscription = collectionReference.orderBy('name').snapshots().listen((datasnapshot){
      setState(() {
        fishlist = datasnapshot.documents;
      });

      for(int i=0;i<fishlist.length;i++){
        select.add(false);
        nameList.add(fishlist[i].data['name']);
      }
    });
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
                            //index = nameList.indexOf(x[0].toUpperCase()+x.substring(1));
//                              for(int x=0;x<fishlist.length;x++){
//                                select[x] = false;
//                              }

                            newNameList.clear();
                            newPriceList.clear();
                            newImageList.clear();
                            for(int j=0;j<nameList.length;j++){
                              if(nameList[j].contains(x[0].toUpperCase()+x.substring(1))){
                                print('there is a match ${nameList[j]}');
//                                  select[j] = true;
                                newNameList.add(nameList[j]);
                                newPriceList.add(fishlist[j].data['price']);
                                newImageList.add(fishlist[j].data['image']);
                              }
                            }
//                            if(count==1){
//                              var y = select.indexOf(true);
//                              price = fishlist[y].data['price'];
//                              //name.text = fishlist[y].data['name'];
//                            }


//                            if(index == -1){
//                              price = '0';
//                              for(int x=0;x<fishlist.length;x++){
//                                select[x] = false;
//                              }
//                            }
//                            else{
//                              select[index] = true;
//                              price = fishlist[index].data['price'];
//                            }

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
                     child: CircleAvatar(
                       backgroundColor: Color(0xfff5f7e1),
                       radius: 15,
                       child: Padding(
                         padding: const EdgeInsets.all(5),
                         child: Image.asset('images/fish.png'),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(8,0,0,0),
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
                           child: Image.asset('images/fossilDe.png'),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        CustomText(text: '10',size: ScreenUtil().setSp(30),bold: false,),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                            width: ScreenUtil().setWidth(30),
                            height: ScreenUtil().setHeight(30),
                            child: Image.asset('images/homeOwl.png')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
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
                        CustomText(text: '10',size: ScreenUtil().setSp(30),bold: false,),
                        SizedBox(width: ScreenUtil().setWidth(10),),
                        SizedBox(
                            width: ScreenUtil().setWidth(30),
                            height: ScreenUtil().setHeight(30),
                            child: Image.asset('images/homeHook.png')),
                      ],
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
                  Color dotColor = Color(0xffEFE8BD);
                  if(caughtList.contains(newName)){
                    dotColor = Color(0xff75CBB5);
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff75CBB5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {

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
                            _settingModalBottomSheet(context);
                          }else{
                            select[i] = false;
                            name.clear();
                            price = '0';
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
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                                child: Container(
                                    width: ScreenUtil().setWidth(30),
                                    height: ScreenUtil().setHeight(30),
                                    //color: Colors.green,
                                    child: Center(child: Image.asset('images/bannerHook.png',fit: BoxFit.contain,))),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: ScreenUtil().setWidth(45)),
                                child: Container(
                                    width: ScreenUtil().setWidth(30),
                                    height: ScreenUtil().setHeight(30),
                                    //color: Colors.green,
                                    child: Center(child: Image.asset('images/bannerOwl.png',fit: BoxFit.contain,))),
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
    );
  }
}
