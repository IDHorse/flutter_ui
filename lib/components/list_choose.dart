import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/list_item.dart';
import 'package:flutterappcrrm/components/model.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class ListChoose extends StatefulWidget {
  List<LabelBean> options;
  List initialValue;
  Function onClick;
  int factor; //每行展示几个
  bool enable;
  bool multiple;
  List<int> selectedIndex;

  ListChoose({
    Key key,
    @required this.options,
    this.onClick,
    this.initialValue,
    this.multiple = false
  })
      : super(key: key);

  @override
  _ListChooseState createState() => _ListChooseState();

}

class _ListChooseState extends State<ListChoose> {

  List<dynamic> _values = [];    /// 选中的值


  @override
  void initState() {
    super.initState();
    if( widget.initialValue != null &&  widget.initialValue is List) {
      _values.addAll(widget.initialValue);
    }
  }

   _handleChoose(LabelBean bean){
    if(widget.multiple) { /// 多选
      setState(() {
        if(!_values.contains(bean.value)){
          _values.add(bean.value);
          return;
        }
        _values.remove(bean.value);
      });
    }else {
      /// 单选
      setState(() {
        _values = [bean.value];
      });
    }

    if(widget.onClick != null) widget.onClick(_values);
  }



  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: widget.options.map((bean) {
        return ListItem.custom(
            titleStyle: TextStyle(
              color: !_values.contains(bean.value) ? Pigment.fromString("#333333")
                  : Pigment.fromString("#1884F0")
            ),
            title: bean.label.toString(),
            trailer: !widget.multiple ?  GestureDetector(
              onTap: (){
                /// 单选操作
              },
              child: Container(
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                child: _values.contains(bean.value) ? Icon(Icons.check, color: Pigment.fromString("#1884F0")) : SizedBox(),
              ),
            ) : GestureDetector(
              onTap: (){
                  /// 多选操作
              },
              child: Container(
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                child: !_values.contains(bean.value) ? Icon(Icons.check_box_outline_blank, color: Pigment.fromString("#C1C1C1"))
                    : Icon(Icons.check_box, color: Pigment.fromString("#1884F0"),) ,
              ),
            ),
            onClick: (title){   /// 单选操作
              _handleChoose(bean);
            },
        );
      }).toList(),
    );

  }
}
