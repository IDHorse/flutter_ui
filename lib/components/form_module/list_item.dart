import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  String title;
  String arrow;
  Widget extra;
  bool isBorder;

  ListItem({
    Key key,
    @required this.title,
    this.extra,
    this.arrow = 'right',
    this.isBorder = true,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: isBorder ?  Border(
              bottom:
                  BorderSide(width: 1, color: Pigment.fromString('#f2f2f2'))): null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.white),
            child: Text(title, style: TextStyle(fontSize: 15)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                 Expanded(
                   child:  extra != null ? extra : Container(),
                 ),
                  arrow != null
                      ? Icon(
                    Icons.keyboard_arrow_right,
                  )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
