import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nookknack/fish.dart';

import 'insects.dart';

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  final CollectionReference collectionReference  = Firestore.instance.collection("others");
  List<DocumentSnapshot> fishlist;
  StreamSubscription<QuerySnapshot> subscription;
  String price = '0';
  List<bool> select = [];
  List<String> nameList = [];
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffffae3),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,15,0,0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Insects()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xfff5f7e1),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('images/butterflyDe.png'),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,15,0,0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Fish()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xfff5f7e1),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('images/fishDe.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,15,0,0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xfff5f7e1),
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset('images/other.png'),
                    ),
                  ),
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                      controller: name,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.all(15),
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
                          var index = nameList.indexOf(x[0].toUpperCase()+x.substring(1));
                          if(index == -1){
                            price = '0';
                            for(int x=0;x<fishlist.length;x++){
                              select[x] = false;
                            }
                          }
                          else{
                            select[index] = true;
                            price = fishlist[index].data['price'];
                          }

                        });

                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xffCCBD73),
                      ),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(price,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          )),
                    ),
                  )
                ],
              ),
            ),

            Divider(
              color: Color(0xffB6A977),
              thickness: 2,
              indent: 22,
              endIndent: 22,
            ),


            Expanded(
              child: fishlist != null? GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 16.0/9.0,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8
                ),
                itemCount: fishlist.length,
                padding: const EdgeInsets.all(10.0),

                itemBuilder: (context,i){
                  String url = fishlist[i].data['image'];
                  String newPrice = fishlist[i].data['price'];
                  String newName = fishlist[i].data['name'];

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
                        child: Image.network(url,fit: BoxFit.contain,),
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
