import 'package:flutter/material.dart';
import 'package:flutterappcrrm/components/input.dart';
import 'package:pigment/pigment.dart';


// ignore: must_be_immutable
class SearchBar extends StatefulWidget {

  bool enabled;
  String hint;
  Widget leading;
  Widget trailing;
  Function onClick;
  Function onSubmitted;

  SearchBar({ Key key,
    this.enabled = false,
    this.leading,
    this.trailing,
    this.onClick,
    this.onSubmitted,
    this.hint = '请搜索'
  }) : super(key: key);

  _SearchBarState createState()=> _SearchBarState();
}
class _SearchBarState extends State<SearchBar> {

  TextEditingController _controller;
  bool _hasValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _controller.addListener( (){
      if(_controller.text != null && _controller.text != "") {
        setState(() {
          _hasValue = true;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color:  Pigment.fromString('#ffffff'),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.leading != null ? Container(
            margin: EdgeInsets.only(left: 5),
            child:  widget.leading,
          ) : Container(),
          Expanded(
            child:  Container(
              height: 34,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color:  Pigment.fromString('#f2f2f2')),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 34,
                    padding: EdgeInsets.all(10),
                    child: Image.asset('imgs/search.png', fit: BoxFit.fill,),
                  ),
                  Expanded(
                    flex: 1,
                    child: widget.enabled ? GestureDetector(
                      onTap: (){
                        widget.onClick();
                      },
                      child: Container(
                        child: Text(widget.hint),
                      ) ,
                    ): Input(
                        controller: _controller,
                        hintText: widget.hint,
                        fillColor: Pigment.fromString('#f2f2f2'),
                        onSubmitted: widget.onSubmitted,

                    ),
                  ),
                  _hasValue ? GestureDetector(
                    onTap: (){
                      _controller.text = "";
                      setState(() {
                        _hasValue = false;
                      });
                    },
                    child: Container(
                      width: 34,
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ): SizedBox(),
                ],
              ),
            ) ,
          ),
          widget.trailing != null ?
          Container(
            margin: EdgeInsets.only(left: 5),
            child:  widget.trailing,
          ): Container()

        ],
      ),
    );
  }
}
