
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/components/search_bar.dart';
import 'package:flutterappcrrm/pages/my_customer/customer_card.dart';
import 'package:flutterappcrrm/pages/select_single_component.dart';
import 'package:flutterappcrrm/view_models/my_customer/my_customer_vm.dart';

// ignore: must_be_immutable
class MyCustomerPage extends StatefulWidget {
  @override
  _MyCustomerState createState() => _MyCustomerState();

}

class _MyCustomerState  extends BaseState<MyCustomerPage, MyCustomerVM> {


  @override
  void onReady(vm) {

  }


  @override
  Widget builder(BuildContext context, _vm, Widget child) {

    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/check_salesroom');
            },
            child: Container(
              alignment: Alignment.center,
              height: 34,
              child: Row(
                children: <Widget>[
                  Text(
                    '北京颐和原著店',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(Icons.arrow_drop_down, size: 22)
                ],
              ),
            ),
          ),
          centerTitle: true,
        ),
        body :Column(
          children: <Widget>[
            SearchBar(
              placeholder: "请输入客户姓名/手机号/维护人姓名",
            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
//              child: ListView.builder(
//                  itemCount: 15,
//                  itemBuilder: (context, index) {
//                    return CustomerCard(
//                        border: false
//                    );
//                  }),
//            ),
//            Positioned(
//                width: MediaQuery.of(context).size.width,
//                top:  100,
//                left: 0,
//                child: Column(
//                  children: <Widget>[
//                      Container(
//                      color: Colors.white,
//                      width: MediaQuery.of(context).size.width,
//                      height: 200,
//                      child: Text("aaa"),
//                    ),
//                    GestureDetector(
//                      onTap: () {
//
//                      },
//                      child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        height: MediaQuery.of(context).size.height,
//                        color: Color.fromRGBO(0, 0, 0, 0.5),
////          color: widget.maskColor,
//                      ),
//                    )
//              ],
//            )),
            SelectComponent(
              menus: _vm.menus,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return CustomerCard(
                        border: false
                      );
                    }),
              ),
            ),
          ],
        ));
  }



  @override
  setViewModel() => MyCustomerVM();

  @override
  bool get wantKeepAlive => false;

}
