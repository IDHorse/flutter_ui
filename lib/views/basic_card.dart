import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardComponent extends StatelessWidget {
  Widget child; // 内容主体
  Widget header; // 自定义头部
  Widget footer; // 自定义底部
  Widget expand; // 自定义扩展
  String title; // 默认title
  String subTitle; // 默认subTitle
  bool border = true;

  CardComponent(
      {Key key,
      this.title,
      this.expand,
      this.subTitle,
      @required this.child,
      this.footer})
      : super(key: key);

  CardComponent.custom(
      {Key key, this.header, @required this.child, this.footer})
      : super(key: key);

  Widget _buildWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(width: 1, color: Color.fromRGBO(240, 240, 240, 0.8)),
      ),
      child: Column(
        children: <Widget>[_drawHeader(), _drawContent(), _drawFooter()],
      ),
    );
  }

  //绘制头部
  Widget _drawHeader() {
    if (header != null) {
      return header;
    }
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color.fromRGBO(240, 240, 240, 0.8)),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              subTitle != null
                  ? Text(
                this.subTitle,
                style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    color: Colors.grey,
                    fontSize: 13),
              )
                  : SizedBox()
            ],
          ),
          expand != null ? expand : SizedBox(),
        ],
      ),
    );
  }

  //绘制card
  Widget _drawContent() {
    return Container(
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color.fromRGBO(240, 240, 240, 0.8)),
      )),
      child: child,
    );
  }

  //绘制底部
  _drawFooter() {
    if (footer != null) {
      return Container(
        padding: EdgeInsets.all(10),
        child: footer,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }
}
