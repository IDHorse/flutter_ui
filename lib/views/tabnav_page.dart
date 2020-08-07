import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNavPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/recommend');
              },
              color: Colors.blue,
              child: Text('推荐', style: TextStyle(color: Colors.white),),
            ),
            FlatButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/my_recommend');
              },
              color: Colors.blue,
              child: Text('我的推荐', style: TextStyle(color: Colors.white),),
            ),
            FlatButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/cc');
              },
              color: Colors.blue,
              child: Text('TabNavPage', style: TextStyle(color: Colors.white),),
            ),
          ]
        )
      ),
    );
  }

}