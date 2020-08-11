import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';




class FormBase extends BaseFormFiled<String> {

  // 定义 controller
  FormBase({
    String initialValue,
    String fieldKey,
    String title,
    Key key,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormBaseState state = field;
        return FormItem(
          title: title,
          child: Text(initialValue, textAlign: TextAlign.right,));
      }
  );

  @override
  _FormBaseState createState() => _FormBaseState();

}

class _FormBaseState extends BaseFormFiledState<String> {


  @override
  FormBase get widget => super.widget; // 获取关联上下文widght


  @override
  void initState() {
    super.initState();
  }

}