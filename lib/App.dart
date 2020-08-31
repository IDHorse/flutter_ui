import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterappcrrm/router.dart';

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


