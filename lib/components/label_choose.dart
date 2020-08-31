
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/wrap_tap.dart';
import 'package:pigment/pigment.dart';



///  [ {"name": "男", "value": 1} ] ,
class LabelBean {
  String label;
  dynamic value;
  LabelBean.fromJson(Map<String, dynamic> json){
    this.label = json["label"];
    this.value = json["value"];
  }
}


// ignore: must_be_immutable
class LabelPicker extends StatefulWidget {
  List<Map<String, dynamic>> options;
  List<dynamic> initialValue;
  Function onClick;
  int factor; //每行展示几个
  bool enable;
  bool multiple;
  List<int> selectedIndex;

  LabelPicker({
      Key key,
      @required this.options,
        this.onClick,
        this.initialValue,
        this.enable = false,
        this.multiple = false,
        this.factor,
        this.selectedIndex})
      : super(key: key);

  @override
  _LabelPickerState createState() => _LabelPickerState();

}

class _LabelPickerState extends State<LabelPicker> {

  List<dynamic> _values = [];    /// 选中的值
  List _options = [];   /// 缓存数据

  @override
  void initState() {
    super.initState();
    if(widget.options != null) {
      widget.options.forEach( (v){
        _options.add( LabelBean.fromJson(jsonDecode(json.encode(v))) );
      });
    }
    if( widget.initialValue != null &&  widget.initialValue is List) {
      _values.addAll(widget.initialValue);   /// 默认添加 初始值
    }
  }


  void _handleChoose(LabelBean bean){
    if(widget.multiple) { /// 多选
      setState(() {
        if(!_values.contains(bean.value)) {
          _values.add(bean.value);
          return;
        }
        _values.remove(bean.value);
      });
    }else{
      setState(() {
        if(!_values.contains(bean.value)) {
          _values = [bean.value];
          return;
        }
        _values.remove(bean.value);

      });
    }



    if(widget.onClick != null) widget.onClick(_values);
  }

  Widget _drawWidget(LabelBean bean) {
    if (widget.factor != null && widget.factor > 0) {
      return  FractionallySizedBox(
          widthFactor: 1/ widget.factor,
          child : GestureDetector(
            onTap: (){
              _handleChoose(bean);
            },
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  minHeight: 32.0,
                  minWidth: 30
              ),
              color: _values.contains(bean.value) ? Pigment.fromString("#E7F3FF") : Pigment.fromString('#F6F6F6'),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(bean.label, textAlign: TextAlign.center, style: TextStyle( color: _values.contains(bean.value) ? Pigment.fromString("#1884F0") : Pigment.fromString('#666666'),),),
            ),
          )
      );
    }

    return  GestureDetector(
        onTap: (){
          _handleChoose(bean);
        },
        child: Container(
            constraints: BoxConstraints(
//                minHeight: 32.0,
//                minWidth: 60
            ),
            color: _values.contains(bean.value) ? Pigment.fromString("#E7F3FF") : Pigment.fromString('#F6F6F6'),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(bean.label, textAlign: TextAlign.center,  style: TextStyle(  fontSize : 16, color: _values.contains(bean.value) ? Pigment.fromString("#1884F0") : Pigment.fromString('#666666'),),),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: widget.factor != null ? 0.0 : 10.0, // 主轴(水平)方向间距
        runSpacing: 10.0, // 纵轴
        children: _options.map((bean) {
          return _drawWidget(bean);
        }).toList(),
      ),
    );

  }
}
