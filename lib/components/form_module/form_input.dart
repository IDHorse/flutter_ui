import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';




class FormInput extends BaseFormFiled<String> {

  // 定义 controller

  final TextEditingController controller;
  final FocusNode focusNode;
  // 定义 controller
   FormInput({
     bool enabled = true,// 是否可输入 默认为true
     String hintText = '请输入', // 提示文案   默认为请输入
     @required String title, // 栏 标题
     Color hintColor = Colors.grey, // 提示文案颜色 默认为灰色
     int hintFontSize , // 提示文案字体大小
     Color fillColor = Colors.white, // 背景色
     Color cursorColor, // 光标的颜色
     String textAlign = 'right',
     String initialValue,
     String fieldKey,

      Key key,
     this.focusNode,
      this.controller,
  }): super(
    key: key,
    fieldKey: fieldKey,
    initialValue: controller != null ? controller.text : (initialValue ?? ''),
    builder: (field) {
      final _FormInputState state = field;
      return FormItem(
        title: title,
        child: TextField(
            controller: state._effectiveController,
            maxLines: 1, //最大行数
            focusNode: state._getFocusNode,
            textAlign: textAlign == 'right' ? TextAlign.end : TextAlign.start,
            cursorColor: cursorColor,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
            ),
            onSubmitted: (_) {
              // 点击键盘上的 "下一步" 回调
//                      focusNode.unfocus();
//                      widget.getFiledValue({
//                        widget.itemKey.toString() :  _controller.value
//                      });
            },
            decoration: InputDecoration(
                isDense: true,
                //改变输入框是否为密集型
                enabled: enabled,
                filled: true,
                //如果为true，则输入使用fillColor指定的颜色填充
                fillColor: fillColor,
                contentPadding: EdgeInsets.zero,
                //重要 用于编辑框对齐
                border: InputBorder.none,
                //去除编辑框下划线
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                errorMaxLines: 1,
                //错误提示的行数
                hintMaxLines: 1,
                // 提示文本行数
                hintText: hintText+' ',
                //提示文本
                hintStyle: TextStyle(
                    color: Colors.grey,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 14))),
      );
    }
  );

  @override
  _FormInputState createState() => _FormInputState();

}

class _FormInputState extends BaseFormFiledState<String> {


  @override
  FormInput get widget => super.widget;   // 获取关联上下文widght


  TextEditingController _controller;
  FocusNode _focusNode = new FocusNode();

  TextEditingController get _effectiveController => widget.controller ?? _controller;
  FocusNode get _getFocusNode => widget.focusNode ?? _focusNode;


  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
  }


  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}


