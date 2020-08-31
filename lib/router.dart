import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/pages/enter_customer/add_customer_page.dart';
import 'package:flutterappcrrm/pages/change_guess_page.dart';
import 'package:flutterappcrrm/pages/change_region_page.dart';
import 'package:flutterappcrrm/pages/clue_page.dart';
import 'package:flutterappcrrm/pages/enter_customer/create_customer_page.dart';
import 'package:flutterappcrrm/pages/enter_customer/follow_up_page.dart';
import 'package:flutterappcrrm/pages/enter_customer/search_output_page.dart';
import 'package:flutterappcrrm/pages/enter_customer/update_customer_page.dart';
import 'package:flutterappcrrm/pages/get_customer_page.dart';
import 'package:flutterappcrrm/pages/my_customer/my_customer_page.dart';
import 'package:flutterappcrrm/pages/my_recommend_page.dart';
import 'package:flutterappcrrm/pages/recommend_page.dart';
import 'package:flutterappcrrm/pages/salesroom_page.dart';
import 'package:flutterappcrrm/pages/tabnav_page.dart';
import 'package:flutterappcrrm/pages/my_customer/transfer_page.dart';

class RouterManage {

  static void push(context, route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushParams(context, route, arguments) {
    Navigator.of(context).pushNamed(route,  arguments:  arguments);
  }

  static final initialRoute = '/';

  static  final Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context ) => TabNavPage(),
    '/recommend': (BuildContext context ) => RecommendPage(),
    '/my_recommend': (BuildContext context ) => MyRecommendPage(),
    '/my_customer': (BuildContext context ) => MyCustomerPage(),
    '/check_salesroom': (BuildContext context ) => SalesroomPage(),
    'xiaodangjia://flutter/crm/follow_up': (BuildContext context ) => FollowUpPage(),
    'xiaodangjia://flutter/crm/update_customer': (BuildContext context ) => UpdateCustomerPage(),
    'xiaodangjia://flutter/crm/search_output': (BuildContext context ) => SearchOutputPage(),
    'xiaodangjia://flutter/crm/transfer': (BuildContext context ) => TransferPage(),
    'xiaodangjia://flutter/crm/add_customer': (BuildContext context ) => AddCustomerPage(),
    'xiaodangjia://flutter/crm/create_customer': (BuildContext context ) => CreateCustomerPage(),
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
            route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context, settings.arguments));
            break;
        }
      }else{
        //不带参数的处理方式
        switch(name){
          case '/login':
            route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context),
                fullscreenDialog: true
            );
            break;
          default:
            route = MaterialPageRoute(
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