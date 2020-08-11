import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/entity/TypeTab.dart';
import 'package:flutterappcrrm/view_models/work_order_view_model.dart';


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
      itemCount: 10,
      itemBuilder: (context,index) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.all( 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.2, color: Colors.grey)
            )
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('地点：北京-朝阳区'),
                    Text('客户：张先生'),
                    Text('电话：13121177622'),
                    widget.currentTab.tab == 'ing'  ? Text('处理人：迪丽热巴') : SizedBox(),
                    widget.currentTab.tab == 'ing'  ? Text('处理时间：2020-07-15 16:53:55') : SizedBox(),
                    widget.currentTab.tab == 'done'  ? Text('成交时间：2020-07-15 16:53:55') : SizedBox(),
                    widget.currentTab.tab == 'over'  ? Text('失效时间：2020-07-15 16:53:55') : SizedBox(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child:  Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child:  Text('求购')
                      ),
                      onTap: (){},
                    ),
                    Text('2020-04-23 16:35:33 提交')
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

  }

  @override
  WorkOrderViewModel setViewModel() {
    return WorkOrderViewModel();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;





}