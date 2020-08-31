import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/label_choose.dart';
import 'package:flutterappcrrm/components/section_list.dart';
import 'package:flutterappcrrm/entity/city_json.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class CityPicker extends StatelessWidget {
  CityPicker({Key key}) : super(key: key);
  List<Map> data = [
    {"value": 'bj', "label": '北京'},
    {"value": 'sh', "label": '上海'},
    {"value": 'tj', "label": '天津'},
    {"value": 'gz', "label": '广州'},
    {"value": 'sz', "label": '深圳'},
    {"value": 'heb', "label": '哈尔滨'},
    {"value": 'xm', "label": '厦门'},
    {"value": 'xa', "label": '西安'},
    {"value": 'ty', "label": '太原'},
    {"value": 'hz', "label": '杭州'},
    {"value": 'wh', "label": '武汉'}
  ];
  //_listHeader
  _listHeader() {
    return Column(
      children: <Widget>[
        FormItem(
            title: '当前等位',
            inline: false,
            child: Wrap(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.25, // 0 -1
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Pigment.fromString('#f2f2f2'),
                      ),
                      child: Text('北京'),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.25, // 0 -1
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Pigment.fromString('#f2f2f2'),
                      ),
                      child: Text('重新定位'),
                    ),
                  ),
                ),
              ],
            )),
        FormItem(title: '热门城市', inline: false, child: LabelPicker(options: data)),
      ],
    );
  }

  // sections数据
  _sections() {
    Map obj = {};
    //  原始数据  ==》   { key: data}
    for (var i = 0; i < cityJson.length; i++) {
      var item = cityJson[i];
      var firstLetter = item['py'].toUpperCase().substring(0, 1);
      if (obj[firstLetter] != null) {
        obj[firstLetter].add({"title": item['nm'], "id": item['id']});
      } else {
        obj[firstLetter] = [];
        obj[firstLetter].add({"title": item['nm'], "id": item['id']});
      }
    }

    // 转换固定格式
    List<Map> arr = [];
    obj.forEach((key, index) {
      arr.add({"key": key, "data": obj[key]});
    });
    arr.sort((left,right)=>left['key'].compareTo(right['key']));
    return arr;
  }


  _build(){
    Map obj = {};
    //  原始数据  ==》   { key: data}
    for (var i = 0; i < cityJson.length; i++) {
      var item = cityJson[i];
      var firstLetter = item['py'].toUpperCase().substring(0, 1);
      if (obj[firstLetter] != null) {
        obj[firstLetter].add({"title": item['nm'], "id": item['id']});
      } else {
        obj[firstLetter] = [];
        obj[firstLetter].add({"title": item['nm'], "id": item['id']});
      }
    }

    var keys = obj.keys.toList();
    keys.sort((left,right)=>left.compareTo(right));
    return Positioned(
      right: 15,
      top: 50,
      child: Column(
        children: keys.asMap().keys.map((index) => InkWell(
          onTap: (){
            var top = sectionKey.currentState.getChildTop(index);
            sectionKey.currentState.animateTo(top);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(keys[index], style: TextStyle(color: Colors.red,fontSize: 12),
            ),
          ),)).toList(),
      ),
    ) ;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Layout(
        title: '选择城市',
        child: Stack(
          children: <Widget>[
            SectionList(
              key: sectionKey,
                listHeader: _listHeader(),
                sections: _sections(),
                onScroll: (){

                }
            ),
            _build()
          ],
        ),
      ),
    );
  }
}
