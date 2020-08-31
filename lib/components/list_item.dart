import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';



// ignore: must_be_immutable
class BaseListItem extends StatelessWidget {

  Widget child;
  BaseListItem({
    Key key,
    @required this.child
  }): super(
      key: key
  );

  @override
  Widget build(BuildContext context) {
    return this.child !=null ? this.child : Container();
  }

}

// ignore: must_be_immutable
class ListItem extends BaseListItem {
  String title;
  bool arrow;
  Widget extra;
  Widget leading;
  bool isBorder;
  Widget trailer;
  Function onClick;
  Color textColor;
  Color titleColor;

  ListItem({
    Key key,
    @required this.title,
    this.extra,
    this.arrow = false,
    this.isBorder = true,
    this.leading,
    this.onClick,
    this.titleColor,
    this.textColor,
  }): super(
      key: key,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: isBorder ?  Border(
                bottom:
                BorderSide(width: 1, color: Pigment.fromString('#f2f2f2'))): null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            leading!= null ? leading : Container(),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(color: Colors.white),
              child: Text(title, style: TextStyle(fontSize: 15)),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  if(onClick != null) onClick(title);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child:  extra != null ? extra : Container(),
                      ),
                      arrow ? Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )

  );



  ListItem.custom({
    Key key,
    @required this.title,
    this.trailer,
    Widget leading,
    Color bgColor = Colors.white,
    Color borderColor,
    TextStyle titleStyle,
    this.isBorder = true,
    double fontSize = 16,
    this.onClick
  })
      : super(
      key: key,
      child: GestureDetector(
        onTap: (){
          if(onClick != null) onClick(title);
        },
        child: Container(
          width: double.infinity,
          height: 42,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                color: bgColor,
                border: isBorder ?  Border(
                    bottom:
                    BorderSide(width: 1, color: borderColor != null ? borderColor :  Pigment.fromString('#f2f2f2'))): null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: bgColor
                  ),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titleStyle != null ? titleStyle :  TextStyle(fontSize: fontSize),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: trailer !=null?  trailer : Container(),
                    )
                )
              ],
            ),
          ),
        ),
      )

  );

}

