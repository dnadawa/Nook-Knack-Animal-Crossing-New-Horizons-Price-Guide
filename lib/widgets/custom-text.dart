import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final double size;
  final Color color;
  final TextAlign align;
  final TextDecoration dec;
  final bool bold;

  const CustomText({Key key, this.text, this.size, this.color=Colors.white, this.align=TextAlign.start, this.dec=TextDecoration.none, this.bold=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          color: color,
          decoration: dec,
          fontWeight: bold?FontWeight.bold:FontWeight.normal,
          fontSize: size
      ),



    );
  }
}