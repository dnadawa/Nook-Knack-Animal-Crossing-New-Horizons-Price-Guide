import 'package:flutter/material.dart';
import 'custom-text.dart';

class Button extends StatelessWidget {

  final onclick;
  final String text;
  final Color color;
  final bool social;
  final IconData icon;


  const Button({Key key, this.onclick, this.text, this.color: Colors.black, this.social=false, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        elevation: 0,
        onPressed: onclick,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white,width: 2)
        ),
        color: color,
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
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