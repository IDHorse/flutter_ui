import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterappcrrm/pages//basic_card.dart';
import 'package:flutterappcrrm/res/font_size.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class CustomerCard extends StatelessWidget {
  Map data;
  bool border;

  CustomerCard({
    Key key,
    this.border = true,
  }) : super(key: key);
  List _list = [
    {'name': '跟进', 'path': '/follow'},
    {'name': '填写带看', 'path': 'xiaodangjia://flutter/crm/transfer'},
    {'name': '联系客户', 'path': 'flutter://transfer'}
  ];

  Widget _footer(context) => Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Image.asset(
                'imgs/share2.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _list.asMap().keys.map((index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, _list[index]['path']);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
                      margin: EdgeInsets.only(left: 12),
                      child: Text(_list[index]['name'].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Pigment.fromString("#666666"))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                              width: 1, color: Pigment.fromString("#CCCCCC"))),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: CardComponent(
          border: border,
          title: '[1级]  张大款',
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
                    Text('意向程度：',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                    RatingBar(
                      ignoreGestures: true,
                      itemSize: 24,
                      tapOnlyMode: true,
                      initialRating: 1,
                      //初始评分 double
                      allowHalfRating: true,
                      //允许0.5评分
                      itemCount: 5,
                      //评分组件个数
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 12,
                      ),
                      onRatingUpdate: (rating) {
//                        setState(() {
//                          this.rate1=rating;
//                        });
                      },
                    )
                  ],
                ),
                height: 20,
                alignment: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('联系电话：139****3124',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                    Text('看房次数：3次',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text('最后跟进/带看时间：2020-04-20',
                    style: TextStyle(
                        fontSize: FontSize.fontSize14,
                        color: Pigment.fromString("#333333"))),
                margin: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Pigment.fromString("#F7F7F7"),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('维护人：迪丽热巴',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                    Text('倒计时(店淘)：5 天',
                        style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            color: Pigment.fromString("#333333"))),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
          footer: _footer(context)),
    );
  }
}
