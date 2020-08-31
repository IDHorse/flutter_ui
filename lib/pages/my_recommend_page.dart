import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/entity/TypeTab.dart';
import 'package:flutterappcrrm/view_models/my_recommend_view_model.dart';
import 'package:flutterappcrrm/pages/order_list.dart';
import 'package:flutterappcrrm/components/search_bar.dart';
import 'package:pigment/pigment.dart';

class MyRecommendPage extends StatefulWidget {
  @override
  _MyRecommendPageState createState() => _MyRecommendPageState();
}

class _MyRecommendPageState extends BaseState<MyRecommendPage, MyRecommendViewModel> {
  PageController _pageController;
  TypeTab _currentTab;
  int _currentIndex = 0;

  @override
  void onReady(MyRecommendViewModel viewModel) {
    _pageController = PageController();
    _currentTab = viewModel.typeTabs[0];

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: viewModel.typeTabs.map( (item) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    _currentTab = item ;
                  });
                },
                child: Container(
                  height: 42.0,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(item.text, style: TextStyle(color:  _currentTab == item ? Colors.blue : Colors.black ),),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: viewModel.typeTabs.length,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;


}
