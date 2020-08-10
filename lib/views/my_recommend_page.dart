import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/entity/TypeTab.dart';
import 'package:flutterappcrrm/view_models/my_recommend_view_model.dart';
import 'package:flutterappcrrm/views/order_list.dart';
import 'package:flutterappcrrm/views/search_bar.dart';

class MyRecommendPage extends StatefulWidget {
  @override
  _MyRecommendPageState createState() => _MyRecommendPageState();
}

class _MyRecommendPageState extends BaseState<MyRecommendPage, MyRecommendViewModel> {

  final List<TypeTab> typeTabs =  <TypeTab> [
    TypeTab("抢单大厅",  "all"),
    TypeTab("待分配", "wii"),
    TypeTab("已接单", "get"),
    TypeTab("执行中", "ing"),
    TypeTab("已完成", "done"),
  ];

  PageController _pageController;
  TypeTab _currentTab;

  @override
  void onReady(MyRecommendViewModel viewModel) {
    _pageController = PageController();
    _currentTab = typeTabs[0];
  }

  @override
  MyRecommendViewModel setViewModel() => MyRecommendViewModel();

  @override
  Widget builder(BuildContext context, MyRecommendViewModel viewModel, Widget child) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的推荐'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 42,
                  alignment: Alignment.center,
                  child: SearchBar(),
                )
              ),

              Text('筛选')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: typeTabs.map( (item) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    _currentTab = item ;
                  });
                },
                child: Container(
                  height: 42.0,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(item.text),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: typeTabs.length,
              itemBuilder: ( context, index) {
                return OrderList(
                  currentTab: _currentTab,
                );
              },
            ),
          )
        ],
      ),
    );
  }


}
