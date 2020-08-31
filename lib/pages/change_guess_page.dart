import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/form_base.dart';
import 'package:flutterappcrrm/components/form_module/form_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_textarea.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/layout.dart';

class ChangeGuessPage extends StatelessWidget {

  final GlobalKey<BaseFormState>  _formKey= new GlobalKey<BaseFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
          title: '转换',
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    BaseForm(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FormBase(
                            fieldKey: 'username',
                            title: "客户姓名",
                            initialValue: "张有钱",
                          ),
                          FormBase(
                            fieldKey: 'userlevel',
                            title: "客户等级",
                            initialValue: "1级",
                          ),
                          FormBase(
                            fieldKey: 'status',
                            title: "当前状态",
                            initialValue: "私客(求购新房)",
                          ),
                          FormPicker(
                            fieldKey: 'intention',
                            title: '转换后状态',
                            options: [
                              {"value": 0, 'label': '地区淘'},
                              {"value": 1, 'label': '店淘'},
                            ],
                          ),
                          FormTextArea(
                            fieldKey: "exrea",
                            title: "备注",
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  var values = _formKey.currentState.getFieldsValue();
                  print(values);
                },
                child: Container(
                  height: 48.0,
                  width: double.infinity,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('确定', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ),
              )

            ],
          )
      ),
    );
  }

}