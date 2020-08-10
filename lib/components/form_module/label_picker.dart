
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/wrap_tap.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class LabelPicker extends StatefulWidget {
  List<Map> data;
  List initialValue;
  Function handleClick;
  int factor; //每行展示几个
  bool enable;
  bool multiple;
  List<int> selectedIndex;

  LabelPicker({
      Key key,
      @required this.data,
        this.handleClick,
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

  List _values = [];


  @override
  void initState() {
    super.initState();
    if( widget.initialValue != null &&  widget.initialValue is List) {
      _values.addAll(widget.initialValue);
    }
  }


  void _handleChoose(value){
    if(widget.multiple) { /// 多选
      setState(() {
        if(!_values.contains(value)) _values.add(value);
        _values.remove(value);
      });
    }

    setState(() {
      _values = [value];
    });

    if(widget.handleClick != null) widget.handleClick(value, _values);
  }

  Widget _drawWidget(String name, value) {
    if (widget.factor != null && widget.factor > 0) {
      return  FractionallySizedBox(
          widthFactor: 1/ widget.factor,
          child : GestureDetector(
            onTap: (){
              _handleChoose(value);
            },
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  minHeight: 32.0
              ),
              color: _values.contains(value) ? Colors.red : Pigment.fromString('#f2f2f2'),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(name, textAlign: TextAlign.center,),
            ),
          )
      );
    }

    return Container(
      constraints: BoxConstraints(
          minHeight: 32.0
      ),
      color: Pigment.fromString('#f2f2f2'),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(name, textAlign: TextAlign.center,),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.factor != null ? 0.0 : 10.0, // 主轴(水平)方向间距
      runSpacing: 10.0, // 纵轴
      alignment: WrapAlignment.start,
      children: widget.data.asMap().keys.map((index) {
        return _drawWidget(widget.data[index]['name'].toString(), widget.data[index]['value']);
      }).toList(),
    );

  }
}
