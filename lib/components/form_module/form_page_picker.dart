import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/popup.dart';

// ignore: must_be_immutable
class FormPagePicker extends BaseFormFiled<String> {

  // 定义 controller
  FormPagePicker({
    Key key,
    String fieldKey,
    String initialValue,
    String placeholder = '请选择',
    String title,
    @required Widget child
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormPagePickerState state = field;
        return  FormItem(
          title: title,
          child: GestureDetector(
            onTap: (){
              Navigator.of(field.context).push(Popup(
                child: child
              ));
            },
            child: Container(
              child: Text( initialValue != null ? initialValue.toString() : placeholder , textAlign: TextAlign.right,),
            ),
          )
        );
      }
  );

  @override
  _FormPagePickerState createState() => _FormPagePickerState();

}

class _FormPagePickerState extends BaseFormFiledState<String> {


  @override
  FormPagePicker get widget => super.widget;   // 获取关联上下文widght

  @override
  void initState() {
    super.initState();
  }

}


