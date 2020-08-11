
import 'dart:collection';

import 'package:flutter/cupertino.dart';


/// 数据加载状态
enum PageState {
  None, // 现在什么也没做(网络请求前,网络请求完成)
  Loading, // 加载中
  LoadingError, // 加载失败(业务逻辑错误)
  LoadingException, // 网络异常
}


// ignore: must_be_immutable
class RecycleView extends StatefulWidget  {

  IndexedWidgetBuilder builder;
  RecycleView({
    Key key,
    @required this.builder,
}): super(key:key);

  @override
  _RecycleViewState createState() => _RecycleViewState();

}

class _RecycleViewState extends State<RecycleView> {

  List _data = [];

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: widget.builder,
        ),
    );
  }

}