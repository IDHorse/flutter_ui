import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/views/ClassPage.dart';
import 'package:flutterappcrrm/views/FindPage.dart';
import 'package:flutterappcrrm/views/SortPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  List<Widget> _pageList = [
    ClassPage(),
    FindPage(),
    SortPage(),

  ];

  onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school,color: Colors.grey), title: Text('讲堂', style: TextStyle(color:  Colors.grey))),
          BottomNavigationBarItem(icon: Icon(Icons.find_in_page, color: Colors.grey,), title: Text('发现', style: TextStyle(color:  Colors.grey),)),
          BottomNavigationBarItem(icon: Icon(Icons.business, color: Colors.grey), title: Text('部落', style: TextStyle(color:  Colors.grey))),
        ],
      ),
    );
  }



}