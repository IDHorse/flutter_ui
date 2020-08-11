
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectComponent extends StatefulWidget {
  List menus; // 默认的下拉框数据
  final Function onclick;
  Widget child;

  SelectComponent(
      {Key key, items, this.onclick, this.child, @required this.menus})
      : super(key: key);

  @override
  _SelectComponentState createState() => _SelectComponentState();
}

class _SelectComponentState extends State<SelectComponent>
    with WidgetsBindingObserver {
  double _modalHeight = 0;
  double _modal = 0;
  bool _show = false;
  int _currentIndex = 0;
  List<Widget> _children = [];

  final GlobalKey key = new GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _onAfterRendering(Duration timeStamp) {
    //这里编写获取元素大小和位置的方法
    RenderObject renderObject = context.findRenderObject();
    Size size = renderObject.paintBounds.size;
    var vector3 = renderObject.getTransformTo(null)?.getTranslation();
    setState(() {
      _modalHeight = MediaQuery.of(context).size.height - vector3[1] - 100;
      _modal = MediaQuery.of(context).size.height - vector3[1] - 140;
    });
  }

  _mask() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _show = false;
        });
      },
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        width: MediaQuery.of(context).size.width,
        height: _modalHeight,
      ),
    );
  }

  // 绘制
  _buildMenus() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            children: widget.menus.asMap().keys.map((index) {
              return Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      WidgetsBinding.instance
                          .addPostFrameCallback(_onAfterRendering);
                      setState(() {
                        if (!_show || _currentIndex == index) {
                          _show = !_show;
                        }
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.menus[index]['placeHolder'].toString(),
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Icon(
                              _show && _currentIndex == index ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                              size: 16,
                              color: _show && _currentIndex == index ?  Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            }).toList(),
          )),
    );
  }

  _buildDrop() {
    return !_show
        ? Container()
        : Positioned(
            key: key,
            top: 40,
            left: 0,
            child: _mask(),
          );
  }
  _buildContent() {
    return !_show
        ? Container()
        : Positioned(
            top: 40,
            left: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
                maxHeight: _modal,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: widget.menus[_currentIndex]['child'],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:  (){
                            setState(() {
                              _show = false;
                            });
                          },
                          child: Container(
                            color:Colors.grey,
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Text('取消',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:  (){
                            setState(() {
                              _show = false;
                            });
                          },
                          child: Container(
                            color:Colors.blue,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            child: Text('确认', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: Stack(overflow: Overflow.visible, children: [
              Container(
                padding: EdgeInsets.only(top: 43),
                child: widget.child,
              ),
              _buildMenus(),
              _buildDrop(),
              _buildContent(),
          ]),
    ));
  }
}
