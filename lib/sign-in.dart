import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nookknack/route-animation.dart';
import 'package:nookknack/sign-up.dart';
import 'package:nookknack/widgets/button.dart';
import 'package:nookknack/widgets/custom-text.dart';
import 'package:nookknack/widgets/inputfield.dart';
import 'package:nookknack/widgets/toast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

class SignIn extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
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

  signInWithEmail(BuildContext context) async {
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      FirebaseUser user = result.user;
      print(user.uid);

      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
        return Home();}));
    }
    catch(E){
      print(E);
      ToastBar(color: Colors.red,text: 'Something went wrong').show();
    }
  }

  resetPassword() async {
    if(email.text!=''){
      try{
        await _firebaseAuth.sendPasswordResetEmail(email: email.text);
        ToastBar(text: 'Password reset link is sent to your email',color: Colors.green).show();
      }
      catch(E){
        ToastBar(text: 'Something went wrong',color: Colors.red).show();
      }

    }
    else{
      ToastBar(text: "Email doesn't exists",color: Colors.red).show();
    }

  }

  signInWithGoogle(BuildContext context) async {
    try{
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
        return Home();}));
    }
    catch(E){
      print(E);
      ToastBar(color: Colors.red,text: 'Something went Wrong').show();
    }
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  CustomText(text: 'Log into your account',size: ScreenUtil().setSp(55),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(60)),
                    child: InputField(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(60)),
                    child: InputField(hint: 'Password',ispassword: true,controller: password,),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(50),),
                  GestureDetector(
                      onTap: ()=>resetPassword(),
                      child: CustomText(text: 'Forgot Password',size: ScreenUtil().setSp(30),dec: TextDecoration.underline,)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),ScreenUtil().setWidth(50),ScreenUtil().setWidth(60),ScreenUtil().setWidth(50)),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: ()=>signInWithEmail(context),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xff75CBB5),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: CustomText(text: 'Log in',size: 18,),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MyCustomRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: CustomText(text: "Don't have an account? Sign Up",size: ScreenUtil().setSp(30),)),
                  SizedBox(height: ScreenUtil().setHeight(40),),
                  CustomText(text: 'OR',size: 20,),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
                    child: Button(text: 'Continue with Google',color: Colors.transparent,icon: FontAwesomeIcons.google,social: true,onclick: ()=>signInWithGoogle(context),),
                  ),
                  GestureDetector(
                      onTap: ()=>showAlertDialog(context),
                      child: CustomText(text: 'Why sign in?',size: ScreenUtil().setSp(30),dec: TextDecoration.underline,)),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
