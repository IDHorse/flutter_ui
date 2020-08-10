
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  String hintText;
  Color fillColor;
  Input({
     this.fillColor,
    this.hintText
}): super();
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 1, //最大行数
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
        ),
        onSubmitted: (_) {
        },
        decoration: InputDecoration(
            isDense: true,
            //改变输入框是否为密集型
            enabled: true,
            filled: true,
            fillColor: fillColor,
            //如果为true，则输入使用fillColor指定的颜色填充
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
            hintText:' ',
            //提示文本
            hintStyle: TextStyle(
                color: Colors.grey,
                textBaseline: TextBaseline.alphabetic,
                fontSize: 16
            )
        )
    );
  }

}