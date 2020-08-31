import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/pages/enter_customer/components/output_card.dart';
import 'package:flutterappcrrm/view_models/enter_customer/add_customer_vm.dart';

import 'components/allert_message.dart';

// ignore: must_be_immutable
class SearchOutputPage extends StatefulWidget {
  @override
  _SearchOutputState createState() => _SearchOutputState();

}

class _SearchOutputState extends BaseState<SearchOutputPage, AddCustomerVM> {

  @override
  void onReady(vm) {}

  @override
  Widget builder(BuildContext context, _vm, Widget child) {
    return Scaffold(
        body: Layout(
          title: "查询结果",
          child: Column(
            children: <Widget>[
              AlertMessage(msg: '这是王璐璐的客户', subMsg: "该客户已录入求购信息，现在只能创建求租"),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return OutputCard(
                            border: true,
                            actions: [
                              {'title': '跟进', 'path': '/follow'},
                              {'title': '填写带看', 'path': '/transfer'},
                              {'title': '联系客户', 'path': 'flutter://transfer'}
                            ],
                        );
                      }),
                ),
              )
            ],
          ),
        )
    );
  }


  @override
  setViewModel() => AddCustomerVM();

  @override
  bool get wantKeepAlive => false;

}
