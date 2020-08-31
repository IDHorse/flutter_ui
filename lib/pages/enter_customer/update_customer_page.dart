

//updateCustomer



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/form_module/form_input.dart';
import 'package:flutterappcrrm/components/form_module/form_label_check.dart';
import 'package:flutterappcrrm/components/form_module/form_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_textarea.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/components/list_item.dart';
import 'package:flutterappcrrm/router.dart';
import 'package:flutterappcrrm/view_models/enter_customer/update_customer_vm.dart';
import 'package:pigment/pigment.dart';

class UpdateCustomerPage extends StatefulWidget {
  @override
  _CreateCustomerPageState createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends BaseState<UpdateCustomerPage, UpdateCustomerVM> {


  @override
  void onReady(UpdateCustomerVM viewModel) {

  }
  @override
  UpdateCustomerVM setViewModel()=>UpdateCustomerVM();

  @override
  Widget builder(BuildContext context, UpdateCustomerVM vm, Widget child) {

    return Scaffold(
      body: Layout(
        title: "完善客户信息",
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
                          ListItem(
                            title: "aaa",
                          ),
                          Container(
                            color: Colors.white,
                            height: 42.0,
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text('客户信息',style: TextStyle(color: Pigment.fromString("#333333"), fontSize: 17.0, fontWeight: FontWeight.w600) ),
                          ),
                          FormInput(
                            title: '通讯方式',
                            fieldKey: 'contactType',
                          ),
                          FormPicker.list(
                            title: '职业',
                            placeholder: "请选择",
                            pickerTitle: "职业",
                            fieldKey: 'customerProfession',
                            options: [
                              {"label": "高管", "value": 1},
                              {"label": "白领", "value": 2},
                              {"label": "个体", "value": 3},
                              {"label": "公务员", "value": 4},
                              {"label": "干部", "value":5},
                              {"label": "自由职业", "value": 6},
                            ],
                          ),
                          FormLabelChoose(
                              title: '证件类型',
                              fieldKey: 'certificateType',
                              inline: true,
                              options: [
                                {"label": "身份证", "value": 1},
                                {"label": "军官证", "value": 2},
                                {"label": "护照", "value": 3}
                              ]
                          ),
                          FormInput(
                            title: '证件号码',
                            fieldKey: 'customerIdcard',
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
//                      1）购买目的：单选、非必填，选项：自住、投资、改善、学区、养老、刚需；
                          FormPicker.list(

                            title: "购买目的",
                            fieldKey: "buyPurpose",
                            pickerTitle: "购买目的",
                            placeholder: "请选择",

                            options: [
                              {"label": "自主", "value": 0},
                              {"label": "投资", "value": 1},
                              {"label": "改善", "value": 2},
                              {"label": "学区", "value": 3},
                              {"label": "养老", "value": 3},
                              {"label": "刚需", "value": 3}
                            ],
                          ),

                      // 2）现居住情况：下拉单选、非必填，选项：自住、合租、借住、自购；
                          FormPicker.list(
                            title: "现居住情况",
                            fieldKey: "dwellSituation",
                            pickerTitle: "现居住情况",
                            placeholder: "请选择",
                            options: [
                              {"label": "自住", "value": 1},
                              {"label": "合租", "value": 2},
                              {"label": "借住", "value": 3},
                              {"label": "自购", "value": 4}
                            ],
                          ),


//                      3）急迫程度：下拉单选，非必填，选项：急迫、随意；
                          FormPicker.list(
                            title: "急迫程度",
                            fieldKey: "urgentDegree",
                            placeholder: "请选择",
                            pickerTitle: "急迫程度",
                            options: [
                              {"label": "急迫", "value": 1},
                              {"label": "随意", "value": 2},
                              {"label": "公积金", "value": 3},
                              {"label": "组合贷", "value": 4},
                            ],
                          ),
//                      4）楼层：非必填，下拉单选/自定义，单选项：非一层、非顶层，自定义：楼层范围可自定义（整数、数字、最多3位数）；
                          FormPicker.list(
                            title: "楼层",
                            fieldKey: "price",
                            pickerTitle: "价格",
                            placeholder: "请选择",
                            options: [
                              {"label": "非一层", "value": 1},
                              {"label": "非顶层", "value": 2},
                            ],
                          ),

//                          5）装修：非必填，下拉、单选，选项：；
                          FormPicker.list(
                            title: "装修",
                            fieldKey: "area",
                            pickerTitle: "面积",
                            placeholder: "请选择",
                            options: [
                              {"label": "毛坯", "value": 1},
                              {"label": "简装", "value": 2},
                              {"label": "精装", "value": 3},
                              {"label": "豪装", "value": 4},
                            ],
                          ),

//                          6）意向楼盘：下拉单选，求购新房专属字段；求购二手房、求租、无此字段，楼盘数据范围：同pc；
                          FormPicker.list(
                            title: "意向楼盘",
                            multiple: true,
                            fieldKey: "intentionBuilding",
                            pickerTitle: "意向楼盘",
                            placeholder: "请选择",
                            options: [
                              {"label": "1居", "value": 1},
                              {"label": "2居", "value": 2},
                              {"label": "3居", "value": 3},
                              {"label": "4居", "value": 4},
                              {"label": "4居以上", "value": 5},
                            ],
                          ),
//                          7）备注：输入框，非必填，200字以内
                          FormTextArea(
                            title: "备注",
                            fieldKey: "remark",

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
