import 'package:flutterappcrrm/components/form_module/list_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormItem extends  StatelessWidget {

  Widget child;
  String title;
  bool inline;

  FormItem({
    this.child,
    this.title,
    this.inline = true
}): super();



  Widget _buildInline(){
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 48.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 0.2, color: Colors.grey )
          )
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text( title ),
          Expanded(
              flex: 1,
              child: child
          ),
        ],
      ),
    );
  }

  Widget _buildOutline(){
    return Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 0.2, color: Colors.grey )
          )
        ),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 42.0,
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.inline ? _buildInline() : _buildOutline();
  }



}