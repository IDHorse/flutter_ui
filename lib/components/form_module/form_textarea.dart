import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';




class FormTextArea extends BaseFormFiled<String> {

  // 定义 controller
  final TextEditingController controller;
  final FocusNode focusNode;

  FormTextArea({
    String initialValue,
    String fieldKey,
    String hintText,
    String title,
    int maxLines = 4,
    int maxLength = 200,
    this.focusNode,
    this.controller,
    Key key,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      builder: (field) {
        final _FormTextAreaState state = field;
        return FormItem(
            inline: false,
            title: title,
            child:  TextField(
                controller: state._effectiveController,
                maxLines: maxLines, //最大行数
                maxLength: maxLength,
                focusNode: focusNode,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                },
                decoration: InputDecoration(
                    isDense: true,
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
                    hintText: hintText,
                    //提示文本
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: 14))
            )
        );
      }
  );

  @override
  _FormTextAreaState createState() => _FormTextAreaState();

}

class _FormTextAreaState extends BaseFormFiledState<String> {


  @override
  FormTextArea get widget => super.widget; // 获取关联上下文widght


  TextEditingController _controller;
  FocusNode _focusNode = new FocusNode();

  TextEditingController get _effectiveController => widget.controller ?? _controller;
  FocusNode get _getFocusNode => widget.focusNode ?? _focusNode;

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
    if (_effectiveController.text != value) didChange(_effectiveController.text);
  }

}