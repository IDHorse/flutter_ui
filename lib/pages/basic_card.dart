import 'package:flutter/material.dart';
import 'package:flutterappcrrm/res/font_size.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class CardComponent extends StatelessWidget {
  Widget child; // 内容主体
  Widget header; // 自定义头部
  Widget footer; // 自定义底部
  Widget expand; // 自定义扩展
  String title; // 默认title
  bool border;

  CardComponent({
    Key key,
    this.title,
    this.border = true,
    this.expand,
    @required this.child,
    this.footer
  })
      : super(key: key);


  Widget _buildWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(width: 1, color: Color.fromRGBO(240, 240, 240, 0.8)),
      ),
      child: Column(
        children: <Widget>[
          _drawHeader(),
          _drawContent(),
          _drawFooter()
        ],
      ),
    );
  }

  //绘制头部
  Widget _drawHeader() => Container(
      decoration: BoxDecoration(
          border: border ? Border(  bottom: BorderSide(width: 0.8, color: Pigment.fromString("#E9E9E9"))) : Border()
      ),
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 19),
            child: Text(this.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Pigment.fromString("#333333"),
                    fontSize: FontSize.fontSize15,
                    fontWeight: FontWeight.w500
                )
            ),
          ),
          expand != null ? expand : SizedBox(),
        ],
      ),
  );


  //绘制card 内容
  Widget _drawContent()  => Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      constraints: BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
          border: border ? Border(  bottom: BorderSide(width: 0.8, color: Pigment.fromString("#E9E9E9"))) : Border()
      ),
      child: child,
  );


  //绘制底部
  _drawFooter() => Container(
    child: footer != null ? footer : SizedBox(),
  );

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }
}
