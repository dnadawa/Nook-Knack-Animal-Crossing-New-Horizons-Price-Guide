import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'custom-text.dart';

class MonthBox extends StatelessWidget {
  final String text;
  final Color color;

  const MonthBox({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
      child: Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color
        ),
        child: Center(child: CustomText(text: text,)),
      ),
    );
  }
}
