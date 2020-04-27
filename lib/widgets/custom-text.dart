import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final double size;
  final Color color;
  final TextAlign align;
  final TextDecoration dec;

  const CustomText({Key key, this.text, this.size, this.color=Colors.white, this.align=TextAlign.start, this.dec=TextDecoration.none}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          color: color,
          decoration: dec,
          fontWeight: FontWeight.bold,
          fontSize: size
      ),



    );
  }
}