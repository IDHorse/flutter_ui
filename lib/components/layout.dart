import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class Layout extends StatelessWidget {

  Widget child; // 内容主体
  String currentRoute;
  Widget expand; // 自定义扩展
  String title; // 默认title
  Color bgColors = Colors.white;
  bool border = true;

  Layout({Key key, @required this.child, this.title, this.bgColors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 42,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1, color: Pigment.fromString('#f2f2f2'))
                )
            ),
            child: Stack(
              children: <Widget>[
                Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: Text(title, style: TextStyle(fontSize: 16))
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: InkWell(
                    onTap: (){
                    },
                    child: SizedBox(
                      height: 22,
                      width: 22,
                      child: Icon(Icons.arrow_back_ios, size: 18),
                    ),
                  ),
                )
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: bgColors,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
