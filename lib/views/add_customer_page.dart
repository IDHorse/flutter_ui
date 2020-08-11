



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/form_module/layout.dart';
import 'package:flutterappcrrm/components/search_bar.dart';
import 'package:pigment/pigment.dart';

class AddCustomerPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        title: '录入客户',
        child: Column(
          children: <Widget>[
            Container(
              color: Pigment.fromString('#cccccc9f'),
              width: double.infinity,
              height: 28,
              alignment: Alignment.centerLeft,
              child: Text('为了避免重复创建客户，请根据手机号查询客户是否存在'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SearchBar(),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text('历史查询')
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }

}