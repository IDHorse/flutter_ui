
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class Input extends StatelessWidget {

  String hintText;
  Color fillColor;
  TextEditingController controller;
  FocusNode focusNode;
  String textAlign;
  Color cursorColor;
  bool enabled;

  /// textInputFormatter: <TextInputFormatter> [
  ///      WhitelistingTextInputFormatter(RegExp("[a-z]"))  正则教研
  ///      WhitelistingTextInputFormatter.digitsOnly,//只输入数字
  ///     BlacklistingTextInputFormatter(RegExp("[a-z]")),   黑名单校验
  ///           LengthLimitingTextInputFormatter(11)//限制长度
  /// ],
  List<TextInputFormatter>  textInputFormatter;

  Function onSubmitted;
  TextInputType keyboardType;
  int maxLength;
  int maxLines;
  String prefixText;

  Input({
    this.fillColor,
    this.controller,
    this.hintText,
    this.enabled = true,
    this.focusNode,
    this.cursorColor,
    this.prefixText = "",
    this.textAlign = "left",
    this.textInputFormatter,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    this.maxLines = 1
  }): super();
  @override
  Widget build(BuildContext context) {
    return TextField(
        inputFormatters: textInputFormatter,
        controller: controller,
        maxLines: 1, //最大行数
        focusNode: focusNode,
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
          onSubmitted(controller.text);
          focusNode.unfocus();
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
            isDense: true,
            //改变输入框是否为密集型
            enabled: enabled,
            filled: true,
            //如果为true，则输入使用fillColor指定的颜色填充
            fillColor: fillColor,
            prefixText: prefixText,
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
                fontSize: 14)));
  }

}