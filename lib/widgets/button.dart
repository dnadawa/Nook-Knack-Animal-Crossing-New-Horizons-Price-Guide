import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom-text.dart';

class Button extends StatelessWidget {

  final onclick;
  final String text;
  final Color color;
  final bool social;
  final IconData icon;
  final bool isBorder;
  final bool isSettings;

  const Button({Key key, this.onclick, this.text, this.color: Colors.black, this.social=false, this.icon, this.isBorder=true, this.isSettings=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSettings==false?double.infinity:ScreenUtil().setWidth(320),
      child: RaisedButton(
        elevation: 0,
        onPressed: onclick,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: isBorder?BorderSide(color: Colors.white,width: 2):BorderSide.none
        ),
        color: color,
        textColor: Colors.white,
        padding: isSettings==false?EdgeInsets.all(15):EdgeInsets.all(0),
        child: social?Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,color: Colors.white,),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)
          ],
        ):CustomText(text: text,size: 18,),
      ),
    );
  }
}