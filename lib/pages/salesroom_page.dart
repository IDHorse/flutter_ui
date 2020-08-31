import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/layout.dart';
import 'package:flutterappcrrm/components/search_bar.dart';

class SalesroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        title: '选择门店',
        child: Column(
          children: <Widget>[
            Container(
              child: SearchBar(),
            ),
            Expanded(
              child:  Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child:  ListView.builder(
                        itemCount: 200,
                        itemBuilder: (ctx, index){
                          return Text('北京');
                        },
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child:   ListView.builder(
                        itemCount: 200,
                        itemBuilder: (ctx, index){
                          return Text('北京时代天街门店');
                        },
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}