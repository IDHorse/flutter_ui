import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/form_module/form_base.dart';
import 'package:flutterappcrrm/components/form_module/form_date_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_label_check.dart';
import 'package:flutterappcrrm/components/form_module/form_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_textarea.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/view_models/enter_customer/create_customer_vm.dart';
import 'package:flutterappcrrm/view_models/enter_customer/follow_up_vm.dart';
import 'package:pigment/pigment.dart';

import '../../router.dart';

class FollowUpPage extends StatefulWidget {
  @override
  _FollowUpPageState createState() => _FollowUpPageState();
}

class _FollowUpPageState extends BaseState<FollowUpPage, FollowUpVM> {


  @override
  void onReady(FollowUpVM viewModel) {

  }
  @override
  FollowUpVM setViewModel()=>FollowUpVM();

  @override
  Widget builder(BuildContext context, FollowUpVM vm, Widget child) {
    return Scaffold(
      body: Layout(
          title: '写跟进',
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    BaseForm(
                      key: vm.formKey,
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
                            pickerTitle: "意向类型",
                            title: '意向类型',
                            options: [
                              {"value": 0, 'label': '男'},
                              {"value": 1, 'label': '女'},
                            ],
                          ),
                          FormLabelChoose(
                            fieldKey: 'followtype',
                            title: "跟进方式",
                            options: [
                              {"value": 0, 'label': '微信'},
                              {"value": 1, 'label': '来电'},
                              {"value": 2, 'label': '去电'},
                              {"value": 3, 'label': '拜访'},
                              {"value": 4, 'label': '短信'},
                            ],
                            factor: 4,
                          ),
                          FormTextArea(
                            fieldKey: "followcontent",
                            title: "跟进内容",
                          ),
                          FormDatePicker(
                            fieldKey: "date",
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
                  RouterManage.push(context, "xiaodangjia://flutter/crm/add_customer/update_customer");
                },
                child: Container(
                  height: 48.0,
                  width: double.infinity,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('提交', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ),
              )

            ],
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;


}
