import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/form_base.dart';
import 'package:flutterappcrrm/components/form_module/form_label_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_textarea.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/form_module/layout.dart';

class FollowPage extends StatelessWidget {

  final GlobalKey<BaseFormState>  _formKey= new GlobalKey<BaseFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        title: '写跟进',
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
                            fieldKey: 'usertype',
                            title: "客户类型",
                            initialValue: "求购",
                          ),
                        FormPicker(
                          fieldKey: 'intention',
                          title: '意向类型',
                          data: [
                            {"value": 0, 'name': '男'},
                            {"value": 1, 'name': '女'},
                          ],
                        ),
                        FormLabelPicker(
                            fieldKey: 'followtype',
                            title: "跟进方式",
                            data: [
                              {"value": 0, 'name': '微信'},
                              {"value": 1, 'name': '来电'},
                              {"value": 2, 'name': '去电'},
                              {"value": 3, 'name': '拜访'},
                              {"value": 4, 'name': '短信'},
                            ],
                            factor: 4,
                          ),
                        FormTextArea(
                          fieldKey: "followcontent",
                          title: "跟进内容",
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
                child: Text('完成推荐', style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            )

          ],
        )
      ),
    );
  }

}