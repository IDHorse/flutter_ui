import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:flutterappcrrm/components/label_choose.dart';
import 'package:flutterappcrrm/entity/base_entity.dart';
import 'package:flutterappcrrm/pages/tab_view.dart';

/// 历史记录model
class NotesModel {
  String title;

}

class MyCustomerVM extends BaseViewModel {


  List menus = [
    {"placeHolder": "客户类型", "child": Container(
      height: 80,
      color: Colors.white,
      child: TabView(),
    )},
    {
      "placeHolder": "客户等级",
      "child": Container(
        child: LabelPicker(
          options: [
            {"value": 1, "value": "一级"},
            {"value": 2, "value": "二级"},
            {"value": 2.5, "value": "2.5级"},
            {"value": 3, "value": "三级"},
            {"value": 4, "value": "四级"},
          ],
          factor: 4,
        ),
      )
    },
    {"placeHolder": "更多", "child": Text('更多型的下拉child')},
    {"placeHolder": "排序", "child": Container(
      child: ListView(
        children: <Widget>[
          Text("默认排序"),
          Text("掉店淘倒计时正序"),
          Text("带看时间正序"),
          Text("带看时间倒序"),
          Text("跟进时间正序"),
          Text("跟进时间倒序"),
          Text("意向程度强弱正序"),
          Text("意向程度强弱倒序"),
        ],
      ),
    )}
  ];

}