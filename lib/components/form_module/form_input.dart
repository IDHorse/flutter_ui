import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
// ignore: must_be_immutable
class FormInput extends BaseFormFiled<String> {

  // 定义 controller
  bool enabled; // 是否可输入 默认为true
  String hintText; // 提示文案   默认为请输入
  Color hintColor; // 提示文案颜色 默认为灰色
  int hintFontSize; // 提示文案字体大小
  Color fillColor; // 背景色
  Color cursorColor; // 光标的颜色
  String textAlign;
  String initialValue;
  String fieldKey;

  // 定义 controller
  FormInput({
    Key key,
    this.fieldKey,
    this.initialValue,
    this.enabled = true,
    this.hintText = '请输入',
    this.fillColor = Colors.white,
    this.hintColor = Colors.grey,
    this.textAlign = 'right',
  }): super(
    key: key,
    fieldKey:fieldKey,
    builder: (field) {
      return Text('哈哈哈哈');
    }
  );

  @override
  _FormInputState createState() => _FormInputState();
}


class _FormInputState extends BaseFormFiledState<String> {

  TextEditingController _controller = TextEditingController();
}


