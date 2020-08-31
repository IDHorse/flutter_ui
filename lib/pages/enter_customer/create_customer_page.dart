import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/form_module/form_input.dart';
import 'package:flutterappcrrm/components/form_module/form_label_check.dart';
import 'package:flutterappcrrm/components/form_module/form_picker.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/router.dart';
import 'package:flutterappcrrm/view_models/enter_customer/create_customer_vm.dart';
import 'package:pigment/pigment.dart';

class CreateCustomerPage extends StatefulWidget {
  @override
  _CreateCustomerPageState createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends BaseState<CreateCustomerPage, CreateCustomerVM> {


  @override
  void onReady(CreateCustomerVM vm) {
    vm.options = vm.options1;
  }
  @override
  CreateCustomerVM setViewModel()=>CreateCustomerVM();

  @override
  Widget builder(BuildContext context, CreateCustomerVM vm, Widget child) {

    return Scaffold(
      body: Layout(
        title: "新建客户",
        child:  Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  BaseForm(
                    key: vm.formKey,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 34),
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            height: 42.0,
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text('客户信息',style: TextStyle(color: Pigment.fromString("#333333"), fontSize: 17.0, fontWeight: FontWeight.w600) ),
                          ),
                          FormInput(
                            title: '客户姓名',
                            fieldKey: 'customerName',
                          ),
                          FormInput.phone(
                            title: '联系电话',
                            fieldKey: 'customerPhone',
                          ),
                          FormInput.number(
                            title: 'ceshi',
                            fieldKey: 'number',
                          ),
                          FormLabelChoose(
                              title: '性别',
                              fieldKey: 'customerSex',
                              inline: true,
                              options: [
                                {"label": "男", "value": 1},
                                {"label": "女", "value": 2}
                              ]
                          ),
                          FormPicker.tab(
                            title: "客户来源",
                            fieldKey: "customerSource",
                            pickerTitle: "意向类型",
                            placeholder: "请选择",
                            options: [
                              {
                                "label": "线下开发",
                                "value": 1,
                                "children": [
                                  {"label": "来电", "value": 1},
                                  {"label": "朋友圈", "value": 2},
                                  {"label": "短信", "value": 3},
                                  {"label": "门店来访", "value": 4},
                                  {"label": "宣传单", "value": 5},
                                ]
                              },
                              {
                                "label": "网络端口",
                                "value": 2,
                                "children": [
                                  {"label": "来电", "value": 1},
                                  {"label": "朋友圈", "value": 2},
                                  {"label": "短信", "value": 3},
                                ]
                              },
                              {
                                "label": "U享家APP",
                                "value": 3,
                                "children": [
                                  {"label": "来电", "value": 1},
                                  {"label": "朋友圈", "value": 2},
                                  {"label": "短信", "value": 3},
                                  {"label": "宣传单", "value": 5},
                                ]
                              },
                              {
                                "label": "线上全员营销",
                                "value": 4,
                                "children": [
                                  {"label": "来电", "value": 1},
                                  {"label": "宣传单", "value": 5},
                                ]
                              },
                              {
                                "label": "营销活动",
                                "value": 5,
                                "children": [
                                  {"label": "宣传单", "value": 5},
                                ]
                              },
                            ],
                          ),
                          FormPicker.list(
                              title: "客户类型",
                              fieldKey: "buyRent",
                              pickerTitle: "意向类型",
                              placeholder: "选择客户类型",
                              options: [
                                {"label": "求购", "value": 1},
                                {"label": "求租", "value": 2}
                              ],
                              onOk: (){
                                vm.handleSetIntentionType();
                              }
                          ),
                          SizedBox(
                            height: 10,

                          ),
                          Container(
                            color: Colors.white,
                            height: 42.0,
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text('客户意向',style: TextStyle(color: Pigment.fromString("#333333"), fontSize: 17.0, fontWeight: FontWeight.w600) ),
                          ),
                          FormPicker.list(
                            title: "意向类型",
                            fieldKey: "intentionType",
                            pickerTitle: "意向类型",
                            placeholder: "请选择",
                            options: vm.options,
                          ),
                          FormPicker.list(
                            title: "用途",
                            fieldKey: "usage",
                            pickerTitle: "用途",
                            placeholder: "请选择",
                            options: [
                              {"label": "住宅", "value": 1},
                              {"label": "商业", "value": 2},
                              {"label": "公寓", "value": 3},
                              {"label": "办公", "value": 4},
                              {"label": "车位", "value": 5},
                            ],
                          ),
                          FormPicker.list(
                            title: "付款方式",
                            fieldKey: "payWay",
                            placeholder: "请选择",
                            pickerTitle: "付款方式",
                            options: [
                              {"label": "一次性", "value": 1},
                              {"label": "商贷", "value": 2},
                              {"label": "公积金", "value": 3},
                              {"label": "组合贷", "value": 4},
                            ],
                          ),
                          FormPicker.list(
                            title: "价格",
                            fieldKey: "price",
                            pickerTitle: "价格",
                            placeholder: "请选择",
                            options: [
                              {"label": "50万以下", "value": 1},
                              {"label": "50-100万", "value": 2},
                              {"label": "100-150万", "value": 3},
                              {"label": "150-200万", "value": 4},
                              {"label": "200-300万", "value": 5},
                              {"label": "300-500万", "value": 5},
                              {"label": "500-1000万", "value": 5},
                              {"label": "1000-1500万", "value": 5},
                              {"label": "1500万以上", "value": 5},
                            ],
                          ),
                          FormPicker.list(
                            title: "面积",
                            fieldKey: "area",
                            pickerTitle: "面积",
                            placeholder: "请选择",
                            options: [
                              {"label": "50㎡以内", "value": 1},
                              {"label": "50-70㎡", "value": 2},
                              {"label": "70-90㎡", "value": 3},
                              {"label": "90-110㎡", "value": 4},
                              {"label": "110-130㎡", "value": 5},
                              {"label": "130-150㎡", "value": 5},
                              {"label": "150-200㎡", "value": 5},
                              {"label": "200㎡以上", "value": 5},
                            ],
                          ),
                          FormPicker.list(
                            title: "居室",
                            multiple: true,
                            fieldKey: "room",
                            pickerTitle: "居室",
                            placeholder: "请选择",
                            options: [
                              {"label": "1居", "value": 1},
                              {"label": "2居", "value": 2},
                              {"label": "3居", "value": 3},
                              {"label": "4居", "value": 4},
                              {"label": "4居以上", "value": 5},
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              RouterManage.push(context, "xiaodangjia://flutter/crm/add_customer/follow_up");
                            },
                            child: Container(
                              height: 48.0,
                              width: double.infinity,
                              color: Pigment.fromString("#1884F0"),
                              margin: EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              child: Text('提交', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;


}
