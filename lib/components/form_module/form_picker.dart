import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/form_module/picker.dart';




class FormPicker extends BaseFormFiled<String> {

  // 定义 controller
  FormPicker({
    String initialValue,
    String fieldKey,
    String title,
    List data,
    Key key,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormPickerState state = field;
        return FormItem(
            title: title,
            child: Picker(
              child: Text('请选择', textAlign: TextAlign.right),
              data: data,
            )

        );
      }
  );

  @override
  _FormPickerState createState() => _FormPickerState();

}

class _FormPickerState extends BaseFormFiledState<String> {


  @override
  FormPicker get widget => super.widget; // 获取关联上下文widght


  @override
  void initState() {
    super.initState();
  }

}