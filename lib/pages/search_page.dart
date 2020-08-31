
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/components/search_bar.dart';

class SearchPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        title: '查询页面',
        child: Column(
          children: <Widget>[
            Container(
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
    );
  }

}