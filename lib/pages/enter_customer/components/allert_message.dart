

import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/res/font_size.dart';
import 'package:pigment/pigment.dart';

/// 页面顶部 滚动提示信息
// ignore: must_be_immutable
class AlertMessage extends  StatelessWidget {
  String msg;
  String subMsg;
  AlertMessage({
    @required this.msg,
    @required this.subMsg,
  }): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pigment.fromString('#FFF2DE'),
      width: double.infinity,
//      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text( msg ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: FontSize.fontSize12,
                  color: Pigment.fromString("#E77105")
              )
          ),
          subMsg != null ? Text( subMsg ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: FontSize.fontSize12,
                  color: Pigment.fromString("#E77105")
              )
          ): SizedBox()
        ],
      ),
    );
  }
}