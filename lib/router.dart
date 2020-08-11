import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/views/add_customer_page.dart';
import 'package:flutterappcrrm/views/change_guess_page.dart';
import 'package:flutterappcrrm/views/change_region_page.dart';
import 'package:flutterappcrrm/views/clue_page.dart';
import 'package:flutterappcrrm/views/follow_page.dart';
import 'package:flutterappcrrm/views/get_customer_page.dart';
import 'package:flutterappcrrm/views/my_customer_page.dart';
import 'package:flutterappcrrm/views/my_recommend_page.dart';
import 'package:flutterappcrrm/views/recommend_page.dart';
import 'package:flutterappcrrm/views/salesroom_page.dart';
import 'package:flutterappcrrm/views/tabnav_page.dart';
import 'package:flutterappcrrm/views/transfer_page.dart';

class RouterManage {

  static void push(context, route) {
    Navigator.push(context, route);
  }

  static final initialRoute = '/';

  static  final Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context ) => TabNavPage(),
    '/recommend': (BuildContext context ) => RecommendPage(),
    '/my_recommend': (BuildContext context ) => MyRecommendPage(),
    '/my_customer': (BuildContext context ) => MyCustomerPage(),
    '/check_salesroom': (BuildContext context ) => SalesroomPage(),
    '/follow': (BuildContext context ) => FollowPage(),
    '/transfer': (BuildContext context ) => TransferPage(),
    '/add_customer': (BuildContext context ) => AddCustomerPage(),
    '/clue': (BuildContext context ) => CluePage(),
    '/get_customer': (BuildContext context ) => GetCustomerPage(),
    '/change_guess': (BuildContext context ) => ChangeGuessPage(),
    '/change_region': (BuildContext context ) => ChangeRegionPage(),
  };


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    // 统一处理路由
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];

    //定义当前需要返回得route对象
    Route route;
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        //带参数的处理方式
        switch(name){
          default:
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
            );
            break;
        }
      }else{
        //不带参数的处理方式
        switch(name){
          case '/login':
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context),
                fullscreenDialog: true
            );
            break;
          default:
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context)
            );
            break;
        }
      }
    }else {
      route = CupertinoPageRoute(
          builder: (context) => Scaffold(
            body: Text(' 没有找到页面'),
          )
      );
    }
    return route;
  }


}