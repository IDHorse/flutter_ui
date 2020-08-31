import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/input.dart';

/// 输入校验   在controller 事件之前
class InputFormat extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 注意：改变newValue时还要加入对光标的控制


    return null;
  }

}


///  绘制 view
class FormInput extends BaseFormFiled<String> {
  // 定义 controller

  final TextEditingController controller;
  final FocusNode focusNode;
  // 定义 controller
   FormInput({
     String extra,                    /// 单位
     bool enabled = true,             /// 是否可输入 默认为true
     String hintText = '请输入',       /// 提示文案   默认为请输入
     @required String title,          /// 栏 标题
     Color hintColor = Colors.grey,   /// 提示文案颜色 默认为灰色
     int hintFontSize ,               /// 提示文案字体大小
     Color fillColor = Colors.white,  /// 背景色
     Color cursorColor,               /// 光标的颜色
     String textAlign = 'right',      /// 文本对齐方式 默认右对齐
     String initialValue,             /// 初始化的值
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
        child: Input(
          controller: state._effectiveController,
          focusNode: state._focusNode,
          cursorColor: cursorColor,
          fillColor: fillColor,
          textAlign: textAlign,
          hintText: hintText,
        ),
      );
    }
  );


  // 定义 controller
  FormInput.phone({
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
          child: Input(
            textInputFormatter: <TextInputFormatter> [
              /// WhitelistingTextInputFormatter(RegExp("[a-z]"))
              WhitelistingTextInputFormatter.digitsOnly,//只输入数字
              LengthLimitingTextInputFormatter(11)//限制长度
            ],
            prefixText: "",
            controller: state._effectiveController,
            keyboardType: TextInputType.phone,
            focusNode: state._focusNode,
            cursorColor: cursorColor,
            fillColor: fillColor,
            textAlign: textAlign,
            hintText: hintText,
          ),
        );
      }
  );


  // 定义 controller
  FormInput.number({
    String unit ,                     /// 单位
    bool enabled = true,              /// 是否可输入 默认为true
    String hintText = '请输入',        /// 提示文案   默认为请输入
    @required String title,           /// 栏 标题
    Color hintColor = Colors.grey,    /// 提示文案颜色 默认为灰色
    int hintFontSize ,                /// 提示文案字体大小
    Color fillColor = Colors.white,   /// 背景色
    Color cursorColor,                /// 光标的颜色
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
          child: Row(
            children: <Widget>[
             Expanded(
               child : Input(
                 textInputFormatter: <TextInputFormatter> [
                   /// WhitelistingTextInputFormatter(RegExp("[a-z]"))
                 ],
                 prefixText: "",
                 controller: state._effectiveController,
                 keyboardType: TextInputType.numberWithOptions(
                     decimal: false,
                     signed: false
                 ),
                 focusNode: state._focusNode,
                 cursorColor: cursorColor,
                 fillColor: fillColor,
                 textAlign: textAlign,
                 hintText: hintText,
               ),
              ),
              unit !=null ? Container(
                margin: EdgeInsets.only(left: 3),
                child:  Text("(${unit})"),
              ): Container()
            ],
          ),
        );
      }
  );




  @override
  _FormInputState createState() => _FormInputState();

}



/// 交互动作
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
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}


