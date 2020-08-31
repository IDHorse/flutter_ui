
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/label_choose.dart';
import 'package:flutterappcrrm/components/search_bar.dart';
import 'package:flutterappcrrm/pages//lite_card.dart';
import 'package:flutterappcrrm/pages//select_single_component.dart';
import 'package:flutterappcrrm/pages//tab_view.dart';

// ignore: must_be_immutable
class GetCustomerPage extends StatelessWidget {
  List _menus = [
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
            {"value": 1, "label": "一级"},
            {"value": 2, "label": "二级"},
            {"value": 2.5, "label": "2.5级"},
            {"value": 3, "label": "三级"},
            {"value": 4, "label": "四级"},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('门店淘宝｜地区淘宝'),
          centerTitle: true,
        ),
        body :Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
//                  FlutterBoost.singleton.open("flutter://citypicker");
                      Navigator.pushNamed(context, '/check_salesroom');
                    },
                    child: Container(
                      height: 34,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '北京颐和原著店',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(Icons.arrow_drop_down, size: 22)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: SearchBar(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SelectComponent(
              menus: _menus,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ListCard();
                    }),
              ),
            ),
          ],
        ));
  }
}
