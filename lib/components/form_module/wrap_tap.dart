import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class WrapTap extends StatelessWidget {

  Function  onClick;
  Widget  child;
  String  title;
  String  fontColor;
  String  bgColor;
  String  borderColor;

  WrapTap({Key key,
    @required this.onClick,
    this.title,
    this.fontColor = '#333333',
    this.bgColor = '#f2f2f2',
    @required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
//          border: Border.all(width: 1, color: )
          borderRadius: BorderRadius.all( Radius.circular(2) ),
          color: Pigment.fromString(bgColor),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: child  != null ? child : Text( title.toString() ,
            style: TextStyle(
                fontSize: 14, color: Pigment.fromString(fontColor))),
      ),
    );
  }
}
