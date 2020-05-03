import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/sign-in.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';
import 'package:nookknack/widgets/toast.dart';

class SignUp extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  CollectionReference collectionReference = Firestore.instance.collection('users');
  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Why sign in?"),
          content: Text("Signin will allow you to save your progress across multiple devices and reduce the risk of data loss"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {Navigator.pop(context);},
            ),
          ],
        );
      },
    );
  }

  signUp() async {
    if(email.text!='' && password.text!=''){
      try{
        AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        FirebaseUser user = result.user;

        await collectionReference.document(email.text).setData({
          'email': email.text,
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

        email.clear();
        password.clear();
        ToastBar(color: Colors.green,text: 'Registration Succesful!').show();
      }
      catch(E){
        ToastBar(color: Colors.red,text: 'Something went Wrong!').show();
        print(E);
      }
    }else{
      ToastBar(color: Colors.red,text: 'Fill the all fields').show();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: true);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/regback.png'),fit: BoxFit.fill)
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(150),
                  child: Image.asset('images/logo.png'),
                ),
                SizedBox(height: ScreenUtil().setHeight(50),),
                CustomText(text: 'Nook Knack',size: ScreenUtil().setSp(70),),
                CustomText(text: 'Catch it. Sell it. Track it.',size: ScreenUtil().setSp(35),bold: false,),
                SizedBox(height: ScreenUtil().setHeight(80),),
                CustomText(text: 'Create an account',size: ScreenUtil().setSp(60),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(100)),
                  child: InputField(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(100)),
                  child: InputField(hint: 'Password',ispassword: true,controller: password,),
                ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),ScreenUtil().setWidth(30),ScreenUtil().setWidth(60),ScreenUtil().setWidth(30)),
              child: SizedBox(
                width: ScreenUtil().setWidth(500),
                child: RaisedButton(
                  elevation: 0,
                  onPressed: ()=>signUp(),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Color(0xff75CBB5),
                  textColor: Colors.white,
                  child: CustomText(text: 'Create an account',size: 18,),
                ),
              ),
            ),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MyCustomRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30),
                                fontWeight: FontWeight.bold
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "Already have an account? "),
                              TextSpan(text: "Sign In",style: TextStyle(decoration: TextDecoration.underline))
                            ]
                        )
                    )),
                SizedBox(height: ScreenUtil().setHeight(60),),
                GestureDetector(
                    onTap: ()=>showAlertDialog(context),
                    child: CustomText(text: 'Why sign in?',size: ScreenUtil().setSp(30),dec: TextDecoration.underline,)),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
