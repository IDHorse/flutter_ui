import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/label_choose.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/components/list_item.dart';
import 'package:flutterappcrrm/components/search_bar.dart';
import 'package:flutterappcrrm/res/font_size.dart';
import 'package:flutterappcrrm/router.dart';
import 'package:flutterappcrrm/view_models/enter_customer/add_customer_vm.dart';
import 'package:pigment/pigment.dart';

import 'components/allert_message.dart';



class AddCustomerPage extends StatefulWidget {
  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends BaseState<AddCustomerPage, AddCustomerVM> {
  @override
  Widget builder(BuildContext context, AddCustomerVM vm, Widget child) {

    return  Scaffold(
      body: Layout(
        title: '录入客户',
        bgColors: Pigment.fromString("#FFFFFF"),
        child: Column(
          children: <Widget>[
            AlertMessage( msg : '为了避免重复创建客户，请根据手机号查询客户是否存在'),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              alignment: Alignment.centerLeft,
              child: Text("查询客户手机号", textAlign: TextAlign.left, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:  FontSize.fontSize14,
                  color: Pigment.fromString("#333333")
              )
              ),
            ),
            SearchBar(
                onSubmitted: (text){
                  RouterManage.push(context, "xiaodangjia://flutter/crm/search_output");
                }
            ),
            ListItem.custom(
                title: "历史记录",
                isBorder: false,
                trailer: GestureDetector(
                  onTap: (){
                    vm.deleteNotes();
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset('imgs/delete.png', fit: BoxFit.fill,),
                  ),
                )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: LabelPicker(
                  options: [
                    { "value": 13121177622, "label": "131 211 77622"},
                    { "value": 131, "label": "131 211 77622"},
                    { "value": 32, "label": "131 211 77622"},
                    { "value": 44, "label": "131 211 77622"},
                  ],
                ),
              )
         ),]
      ),
      ),
    );
  }

  @override
  void onReady(AddCustomerVM vm) {

  }

  @override
  AddCustomerVM setViewModel() => AddCustomerVM();

  @override
  bool get wantKeepAlive => false;


}
