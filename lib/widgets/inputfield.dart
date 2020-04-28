import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class InputField extends StatelessWidget {

  final String hint;
  final TextInputType type;
  final bool ispassword;
  final TextEditingController controller;
  final bool isChecklist;

  const InputField({Key key, this.hint, this.type, this.ispassword=false, this.controller, this.isChecklist=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  !isChecklist?EdgeInsets.only(top: 20):EdgeInsets.all(0),
      child: TextField(
        style: textStyle,
        cursorColor: Colors.white,
        keyboardType: type,
        controller: controller,
        obscureText: ispassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyle,
          enabledBorder:UnderlineInputBorder(
              borderSide: !isChecklist?BorderSide(color: Colors.white, width: 2):BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: !isChecklist?BorderSide(color: Colors.white, width: 5):BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          ),

        ),
      ),
    );
  }
}