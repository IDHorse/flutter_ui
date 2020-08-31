import 'package:flutterappcrrm/components/list_item.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';


// ignore: must_be_immutable
class FormItem extends  StatelessWidget {

  Widget child;
  String title;
  bool inline;
  bool required;
  bool arrow;

  FormItem({
    this.child,
    this.title,
    this.arrow = false,
    this.inline = true,
    this.required = false,
}): super();



  Widget _buildInline(){
    return ListItem(
      title: title,
      leading: required ? Container(
        child: Image.asset('imgs/required.png', fit: BoxFit.fill,),
      ): SizedBox(),
      arrow: arrow,
      extra: Container(
          alignment: Alignment.centerRight,
          child: child,
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
              bottom: BorderSide(width: 1, color: Pigment.fromString("#F5F5F5") )
          )
        ),
        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 48.0,
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
            Container(
              alignment: Alignment.centerLeft,
              color: Pigment.fromString("#ffffff"),
              padding: EdgeInsets.only(right: 10, bottom: 10),
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