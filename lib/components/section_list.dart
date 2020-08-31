import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class SectionBuild extends StatelessWidget {
  List<Widget> children;
  String title;
  Function callback;

  SectionBuild(
      {Key key,
      @required this.children,
      @required this.callback,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 38,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15),
        color: Colors.blue,
        child: Text(
          title.toString(),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      Column(
        children: children,
      )
    ]);
  }
}

// ignore: must_be_immutable
class SectionList extends StatefulWidget {
  Widget listHeader;
  Widget listFooter;
  Widget lstEmpty;
  Widget itemSeparator;
  Widget sectionSeparator;
  Function renderItem;
  Function onScroll;
  List<Map> sections;

  SectionList(
      {Key key,
      this.listHeader,
      this.itemSeparator,
      this.listFooter,
      this.lstEmpty,
      this.onScroll,
      @required this.sections,
      this.sectionSeparator})
      : super(key: key);

  SectionListState createState() => SectionListState();
}

GlobalKey<SectionListState> sectionKey = GlobalKey();

class SectionListState extends State<SectionList> {
  ScrollController _controller = new ScrollController();
  List _contexts = [];
  GlobalKey headerKey = GlobalKey();

  _onScroll() {}

  getChildTop(int index) {
//     L.e(_contexts.toString());
    double headerTop =
        widget.listHeader != null ? headerKey.currentContext.size.height : 0.0;
    if (index == 0) return headerTop;
    var top = 38 * index + headerTop;
    for (var i = 0; i < index; i++) {
      top = top + (36 * widget.sections[i]['data'].length);
    }
    return top;
  }

  // 对外暴露的滑动方法
  animateTo(offset) {
    _controller.jumpTo(
      offset,
//        duration: Duration(milliseconds: 200),
//        curve: Curves.ease
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  _buildItem(index) {
    List arr = widget.sections[index]['data'];
    return arr.asMap().keys.map((i) {
      return Container(
        height: 36,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Pigment.fromString('#e9e9e9')))),
        child: Text(arr[i]['title'], style: TextStyle(fontSize: 14)),
      );
    }).toList();
  }

  _buildHeader() {
    return Container(
      key: headerKey,
      child: widget.listHeader,
    );
  }

  _callback(context) {
    setState(() {
      _contexts.add(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
//        physics: new NeverScrollableScrollPhysics(),
        controller: _controller,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: widget.listHeader != null ? _buildHeader() : Container(),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  widget.sections.asMap().keys.map((index) {
            return SectionBuild(
              children: _buildItem(index),
              callback: _callback,
              title: widget.sections[index]['key'].toString(),
            );
          }).toList())),
        ],
      ),
    );
  }
}
