



import 'package:flutter/cupertino.dart';

class TabView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}