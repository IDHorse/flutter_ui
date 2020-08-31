import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/list_item.dart';
import 'package:pigment/pigment.dart';
import 'package:flutterappcrrm/components/model.dart';



// ignore: must_be_immutable
class TabChoose extends StatefulWidget {
  List<Map<String, dynamic>> options;
  List<dynamic> initialValue;
  Function handleClick;
  int factor; //每行展示几个
  bool enable;
  bool multiple;
  List<int> selectedIndex;

  TabChoose({
    Key key,
    @required this.options,
    this.handleClick,
    this.initialValue,
    this.multiple = false})
      : super(key: key);

  @override
  _TabChooseState createState() => _TabChooseState();

}

class _TabChooseState extends State<TabChoose> {

  List _values = [];
  List _options = [];  /// [ [] [] [] ]
  int cols;


  @override
  void initState() {
    super.initState();
//    if(widget.options != null) {
//      handleData(widget.options);
//      widget.options.forEach( (v){
//        _options.add( LabelBean.fromJson(jsonDecode(json.encode(v))) );
//      });
//    }
    if( widget.initialValue != null &&  widget.initialValue is List) {
      _values.addAll(widget.initialValue);
    }
  }


  /// 处理数据   widget.options 【 { label value children} 】 =



  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 1),
      child: Row(
        children: widget.options.map( (col){
          return  Container(
            width: 140,
            child:  ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index){
                return Container(
                  alignment: Alignment.center,
                  child: ListItem.custom(
                    isBorder: false,
                    fontSize: 14.0,
                    title: "北京大发生地方",
                    bgColor: Pigment.fromString("#f2f2f2"),
                  ),
                );
              },
            ),
          );
        }).toList(),
//        children: <Widget>[

//          Expanded(
//            flex: 1,
//            child:   ListView.builder(
//              itemCount: 20,
//              itemBuilder: (ctx, index){
//                return  ListItem.custom(  bgColor: Pigment.fromString("#f2f2f2"), isBorder: false, fontSize: 14.0,title: "北京大发生地方");
//              },
//            ),
//          )
//        ],
      ),
    );

  }
}
