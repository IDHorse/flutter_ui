import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Picker extends StatefulWidget {
  Widget child;
  Function getFiledValue;
  String itemKey;
  List data;
  Picker({
    Key key,
    @required this.child,
    this.getFiledValue,
    this.itemKey,
    this.data,
  }) : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Container(
                height: 260,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              widget.getFiledValue({
                                widget.itemKey.toString() :  widget.data[index]['value']
                              });
                            },
                            child: ListTile(
                              title: Text(widget.data[index]['name'].toString()),
                            ),
                          );
                        },
                        itemCount: widget.data.length,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 42,
                        color: Colors.blue,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text('确定',style: TextStyle(fontSize: 18,color: Colors.white)),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: widget.child,
    );
  }
}
