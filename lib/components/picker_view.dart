import 'dart:convert';
import 'package:flutterappcrrm/components/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// picker view  take form  [ [ {label,value}] ]


// ignore: must_be_immutable
class PickerView extends StatefulWidget {

  List<Map<String, dynamic>> options;
  Function onSelectedItemChanged;
  double itemExtent;
  int initialValue;

  PickerView({
    Key key,
    @required this.options,
    this.itemExtent = 36.0,
    this.initialValue,
    this.onSelectedItemChanged
  }): super(key:key);

  @override
  _PickerViewState createState() => _PickerViewState();
}

class _PickerViewState extends State<PickerView> {

  FixedExtentScrollController _fixedExtentScrollController;
  List _options = [];
  @override
  void initState() {
    super.initState();
    ///  变更数据
    if(widget.options != null) {
      widget.options.forEach( (v){
        _options.add( LabelBean.fromJson(jsonDecode(json.encode(v))) );
      });
    }
    if( widget.initialValue != null){
      int index = _options.indexWhere( (element)=> element.value == widget.initialValue);
      _fixedExtentScrollController = FixedExtentScrollController(initialItem: index);
    }else {
     _fixedExtentScrollController = FixedExtentScrollController();
    }

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: _fixedExtentScrollController,
      backgroundColor: Colors.white,
      children: _options.map((item) {
        return Center(
          child: Text(
            item.label.toString(),
            style: TextStyle(color: Colors.black87, fontSize: 16),
            maxLines: 1,
          ),
        );
      }).toList(),
      onSelectedItemChanged: (index){
        if( widget.onSelectedItemChanged != null ) widget.onSelectedItemChanged(_options[index]);
      },
      itemExtent: widget.itemExtent,
    );
  }


  @override
  void dispose() {
    super.dispose();
    _fixedExtentScrollController.dispose();
  }

}