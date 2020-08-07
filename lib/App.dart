import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/router.dart';
import 'package:flutterappcrrm/views/HomePage.dart';
import 'package:flutterappcrrm/views/SeniorPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM管理',
//      routes:  RouterManage.routes,
      initialRoute: RouterManage.initialRoute,
      onGenerateRoute: RouterManage.onGenerateRoute,
    );
  }

}


