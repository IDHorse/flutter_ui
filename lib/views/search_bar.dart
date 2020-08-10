
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/input.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {

  bool enabled;
  String hint;

  SearchBar({ Key key, this.enabled = false, this.hint = '请搜索' }) : super(key: key);

  _SearchBarState createState()=> _SearchBarState();
}
class _SearchBarState extends State<SearchBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: double.infinity,
//      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color:  Pigment.fromString('#f7f7f7')),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 34,
//            padding: EdgeInsets.only(top:2),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Expanded(
            flex: 1,
            child: widget.enabled ? Container(
              child: Text(widget.hint),
            ) : Input(
                hintText: widget.hint,
                fillColor: Pigment.fromString('#f7f7f7')
            ),
          )
        ],
      ),
    );
  }
}
