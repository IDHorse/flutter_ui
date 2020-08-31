import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterappcrrm/pages//basic_card.dart';
import 'package:flutterappcrrm/res/font_size.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class OutputCard extends StatelessWidget {
  Map data;
  bool border;
  List<Map<String, dynamic>> actions;

  OutputCard({
    Key key,
    this.border = true,
    @required this.actions
  }) : super(key: key);


  Widget _footer(context) => Container(
    margin: EdgeInsets.only(top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: actions.map((item) {
        return GestureDetector(
          onTap: () {
//            Navigator.pushNamed(context, _list[index]['path']);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
            margin: EdgeInsets.only(left: 12),
            child: Text(item["title"],
                style: TextStyle(
                    fontSize: 14, color: Pigment.fromString("#666666"))),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                    width: 1, color: Pigment.fromString("#CCCCCC"))),
          ),
        );
      }).toList(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: CardComponent(
          border: border,
          title: '冯宝宝  139****2657',
          expand: Container(
            alignment: Alignment.center,
            height: 19,
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
            color: Pigment.fromString("#FFF3DB"),
            child: Text('求租',
                style: TextStyle(
                    fontSize: 12, color: Pigment.fromString("#F19C1C"))),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text('门店：',
                        style: TextStyle(
                            wordSpacing: 20,
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#999999"))),
                    Text('北京颐和原著店',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text('录入时间：',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#999999"))),
                    Text('北京颐和原著店',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text('开发 人：',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#999999"))),
                    Text('北京颐和原著店',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text('维护 人：',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#999999"))),
                    Text('北京颐和原著店',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text('最近跟进/带看时间：',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#999999"))),
                    Text('2020-08-01',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
          footer: _footer(context)),
    );
  }
}
