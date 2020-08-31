import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/list_choose.dart';
import 'package:flutterappcrrm/components/model.dart';
import 'package:flutterappcrrm/components/picker.dart';
import 'package:flutterappcrrm/components/picker_view.dart';
import 'package:flutterappcrrm/components/tab_choose.dart';
import 'package:pigment/pigment.dart';

// ignore: must_be_immutable
class FormPicker extends BaseFormFiled<List<dynamic>> {

  List<Map<String, dynamic>> options;
  bool multiple;
  String placeholder;
  String pickerTitle;
  Function onSelectedItemChanged;
  Function onOk;
  Function onCancel;
  String fieldKey;
  String title;
  bool enable ;
  double itemExtent;

  // 定义 controller
  FormPicker({
    List<dynamic> initialValue,
    this.placeholder,
    this.pickerTitle,
    this.onSelectedItemChanged,
    this.fieldKey,
    this.title,
    this.onOk,
    this.onCancel,
    this.enable = true,
    this.multiple = false,
    @required this.options,
    this.itemExtent = 36.0,
    Key key,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      enable: enable,
      placeholder: placeholder,
      builder: (field) {
        final _FormPickerState state = field;
        return FormItem(
            title: title,
            child: Picker(
                pickerTitle: pickerTitle !=null? pickerTitle : "",
                onOk: state.handleOnOk,
                onCancel: state.handleCancel,
                child: Container(
                  height: 260,
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: PickerView(
                            options: options,
                            onSelectedItemChanged: onSelectedItemChanged,
                          )
                      ),
                    ],
                  ),
                ),
            ),

        );
      }
  );

  /// 楼梯选择
  FormPicker.tab({
    Key key,
    List<dynamic> initialValue,
    this.placeholder,
    this.pickerTitle,
    this.onSelectedItemChanged,
    this.fieldKey,
    this.title,
    this.onOk,
    this.onCancel,
    this.enable = true,
    this.multiple = false,
    @required this.options,
    this.itemExtent = 36.0
  }): super(
      key: key,
      fieldKey: fieldKey,
      enable: enable,
      initialValue: initialValue,
      placeholder: placeholder,
      builder: (field) {
        final _FormPickerState state = field;
        return FormItem(
          title: title,
          child: Picker(
              height: 320,
              pickerTitle: pickerTitle,
              onOk: state.handleOnOk,
              onCancel: state.handleCancel,
              child: TabChoose(
                multiple: false,
                options: options,
              )
          ),

        );
      }
  );





  /// 列表单选
  FormPicker.list({
    Key key,
    List<dynamic> initialValue,
    this.placeholder,
    this.pickerTitle,
    this.onSelectedItemChanged,
    this.fieldKey,
    this.title,
    this.onOk,
    this.onCancel,
    this.enable = true,
    this.multiple = false,
    @required this.options,
    this.itemExtent = 36.0
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      placeholder: placeholder,
      enable: enable,
      builder: (field) {
        final _FormPickerState state = field;   /// 强制类型转换
        /// 格式化 数据
        List<LabelBean> _options = [];
        if(options != null) {
          options.forEach( (v){
            _options.add(LabelBean.fromJson(jsonDecode(json.encode(v))) );
          });
        }
        /// 设置行内显示的值
        String handleShowValue(){
          String _p;
          /// 计算展示的内容
          _p = state.value.map( (item){
            return _options.firstWhere((e){ return e.value == item;}).label;
          }).join(",");
          _p = _p.substring(0, _p.length);
          return _p;
        }
        return FormItem(
            title: title,
            arrow: true,
            child: state.enable ?  Picker(
                multiple: multiple,
                height: options.length  > 6 ? itemExtent * 6 + 78 : options.length * itemExtent +  78,
                extra:  Text(
                        state.value != null && state.value.length >0 ? handleShowValue() : placeholder,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 15,
                            color:  state.value != null && state.value.length >0 ? Pigment.fromString("#333333") : Pigment.fromString("#CCCCCC")
                        )
                ),
                pickerTitle: pickerTitle,
                onCancel: state.handleCancel,
                onOk: state.handleOnOk,
                child: ListChoose(
                  options: _options,
                  initialValue: state.value,
                  multiple: multiple,
                  onClick: (_v){
                    state.handleItemClick(_v);
                  },
                )
            ) :  Text(
                state.value != null && state.value.length >0 ? handleShowValue() : placeholder,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    color:  state.value != null && state.value.length >0 ? Pigment.fromString("#333333") : Pigment.fromString("#CCCCCC")
                )
            ),

        );
      }
  );


  /// 自定义
  FormPicker.custom({
    List<dynamic> initialValue,
    String placeholder = "请选择",
    String pickerTitle,
    Function onSelectedItemChanged,
    String fieldKey,
    Function remoteFunc,
    String title,
    bool enable = true,
    double height = 300,
    Key key,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      placeholder: placeholder,
      enable: enable,
      builder: (field) {
        final _FormPickerState state = field;   /// 强制类型转换
        return FormItem(
          title: title,
          child: state.enable ?  Picker.custom(
              height: height,
              extra:  Text("aaa"),
              child: Text("aaaaaa"),
          ) :  Text("null"),
        );
      }
  );

  @override
  _FormPickerState createState() => _FormPickerState();
}



class _FormPickerState extends BaseFormFiledState<List<dynamic>> {

  List<dynamic> _cacheValue = []; /// 缓存数据

  /// 处理确定按钮  只有在多选的时候 出现
  handleOnOk (){
    if(!widget.multiple) return;
    didChange(_cacheValue);
    if(widget.onOk != null ) widget.onOk();
    Navigator.of(context).pop(); /// 数据设置完成直接消除推出
  }
  /// 处理单个按钮点击事件
  handleItemClick(_v){
    /// 单选 更改且消退
    if(!widget.multiple) {
      didChange(_v);
      if(widget.onOk != null ) {
        widget.onOk();
      }
      Navigator.of(context).pop();
      return;
    }
    /// 多选 缓存数据
    setState(() {
      _cacheValue = _v;
    });

  }
  /// 处理取消按钮  清除缓存
  handleCancel() {
    setState(() {
      _cacheValue = value;
    });
    if(widget.onCancel != null ) widget.onCancel();
    Navigator.of(context).pop();
  }


  @override
  FormPicker get widget => super.widget; // 获取关联上下文widght


  @override
  void initState() {
    super.initState();
    if(widget.initialValue != null) {
      _cacheValue.addAll(widget.initialValue);  /// 缓存初始值
    }

  }

}