import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/entity/TypeTab.dart';
import 'package:flutterappcrrm/view_models/work_order_view_model.dart';
//import 'package:flutterappcrrm/views/statelesswidget/order_card.dart';


// ignore: must_be_immutable
class OrderList extends StatefulWidget {


   TypeTab currentTab;

   OrderList({this.currentTab}):super();
  @override
  OrderListState createState() => OrderListState();

}

class OrderListState extends BaseState<OrderList, WorkOrderViewModel>  {

  @override
  Widget builder(BuildContext context, WorkOrderViewModel viewModel, Widget child) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index) {
        return Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('北京-朝阳区')
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void onReady(WorkOrderViewModel viewModel) {
    print(widget.currentTab.tab);
  }

  @override
  WorkOrderViewModel setViewModel() {
    return WorkOrderViewModel();
  }

  @override
  bool get wantKeepAlive => true;



}