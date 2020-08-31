

import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/label_choose.dart';

// ignore: must_be_immutable
class FormLabelChoose extends BaseFormFiled<List<dynamic>> {

  List<Map<String,dynamic>> options = [];

  // 定义 controller
  FormLabelChoose({
    Key key,
    String fieldKey,
    bool multiple = false,
    List<dynamic> initialValue,
    String title,
    bool inline = false,
    @required this.options,
    int factor
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormLabelCheckState state = field;
        return  FormItem(
          inline: inline,
          title: title,
          child: LabelPicker(
            options: options,
            factor: factor,
            initialValue: initialValue,
            onClick: (values) {
              state.didChange(values);
            },
          ),
        );
      }
  );

  @override
  _FormLabelCheckState createState() => _FormLabelCheckState();

}

class _FormLabelCheckState extends BaseFormFiledState<List<dynamic>> {


  @override
  FormLabelChoose get widget => super.widget;   // 获取关联上下文widght


  @override
  void initState() {
    super.initState();
  }

}

