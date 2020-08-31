import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';


// ignore: must_be_immutable
class BasePicker extends StatelessWidget {

  Widget extra;
  bool isScrollControlled;
  bool isDismissible;
  Function builder;
  BasePicker({
    Key key,
    @required this.extra,
    this.isScrollControlled =  true,
    this.isDismissible = true,
    @required this.builder,
  }): super(
      key: key
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          showModalBottomSheet(
              context: context,
              isScrollControlled: isScrollControlled,
              isDismissible: isDismissible,
              builder: builder
          );
        },
        child: extra
    );
  }

}

///  点击按钮 弹出和显示
// ignore: must_be_immutable
class Picker extends BasePicker {

  Widget child;
  Widget extra;
  Function onOk;
  Function onCancel;
  bool multiple;
  List data;
  String pickerTitle;
  double height;

  Picker({
    Key key,
    @required this.child,
    this.pickerTitle = "",
    this.onOk,
    this.onCancel,
    this.extra,
    this.multiple = false,
    this.height = 200,
  }) : super(
      key: key,
      extra: extra,
      builder: (context){
        return Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 47,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:  Border(
                        bottom:
                        BorderSide(width: 1, color: Pigment.fromString('#f2f2f2')))),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    multiple ? GestureDetector(
                      child:  Text("取消"),
                      onTap: (){
                        if(onCancel!=null) onCancel();
                      },
                    ) : SizedBox(),
                    Text(pickerTitle, style: TextStyle(fontSize: 18, color: Pigment.fromString("#333333"), fontWeight: FontWeight.w600),),
                    multiple ? InkWell(
                      onTap: (){
                        if(onOk!=null) onOk();
                      },
                      child:  Text("确定"),
                    ): GestureDetector(
                      child:  Icon(Icons.clear, color:  Pigment.fromString("#999999"), size: 20,),
                      onTap: (){
                        if(onCancel!=null) onCancel();
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        );
      },

  );

  Picker.custom({
    Key key,
    @required this.child,
    this.extra,
    this.height = 200,
  }) : super(
    key: key,
    extra: extra,
    builder: (context){
      return Container(
        height: height,
        child: child,
      );
    },

  );


}
