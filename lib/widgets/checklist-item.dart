import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'custom-text.dart';

class ChecklistItem extends StatefulWidget {
  final bool list;
  final String name;
  final Function onTap;

  const ChecklistItem({Key key, this.list, this.name, this.onTap}) : super(key: key);
  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1520, allowFontScaling: false);
    return Row(
      children: <Widget>[
        SizedBox(width: ScreenUtil().setWidth(50),),
        GestureDetector(
          onTap: widget.onTap,
          child: CircleAvatar(
            backgroundColor: Color(0xffEFE8BD),
            radius: ScreenUtil().setWidth(22),
            child: widget.list?Icon(Icons.check,size: ScreenUtil().setWidth(40),color: Color(0xff75CBB5),):SizedBox.shrink(),
          ),
        ),
        SizedBox(width: ScreenUtil().setWidth(40),),
        CustomText(text: widget.name,)
      ],
    );
  }
}
