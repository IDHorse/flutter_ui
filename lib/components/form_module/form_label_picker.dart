

import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/form_module/label_picker.dart';

// ignore: must_be_immutable
class FormLabelPicker extends BaseFormFiled<String> {




  // 定义 controller
  FormLabelPicker({
    Key key,
    String fieldKey,
    String initialValue,
    String title,

  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormLabelPickerState state = field;
        return  FormItem(
          inline: false,
          title: title,
          child: LabelPicker(
            multiple: false,
            data: state.data,
            initialValue: [1],
            factor: 4,
          ),
        );
      }
  );

  @override
  _FormLabelPickerState createState() => _FormLabelPickerState();

}

class _FormLabelPickerState extends BaseFormFiledState<String> {
  final List<Map<String,dynamic>> data = [
    {"value": 0, 'name': '求购'},
    {"value": 1, 'name': '求租'}
  ];

  @override
  FormLabelPicker get widget => super.widget;   // 获取关联上下文widght


  @override
  void initState() {
    super.initState();

  }

}


