



import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class ClassifyTitle extends StatelessWidget {

  String title;
  var trailing;


  ClassifyTitle({ @required this.title, @required this.trailing }): super();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 2.5,
                    height: 30.0,
                    margin: EdgeInsets.only(right: 10.0),
                    color: Pigment.fromString('#fa8919'),
                  ),
                  Text( title, style: TextStyle(fontSize: 17.0))
                ],
              ),
             trailing
            ]
        )
    );
  }

}