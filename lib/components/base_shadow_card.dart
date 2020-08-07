



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseShadowCard extends StatelessWidget {


  Widget child;

  BaseShadowCard({@required this.child}): super();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      padding: EdgeInsets.fromLTRB( 15.0, 0.0, 15.0, 10.0),
      margin: EdgeInsets.symmetric( horizontal: 0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey[300],offset: Offset(1, 1),
              ///模糊阴影半径
              blurRadius: 5,
            ),
          ]
      ),
      child: this.child,

    );
  }

}