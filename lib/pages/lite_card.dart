import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterappcrrm/pages//basic_card.dart';


// ignore: must_be_immutable
class ListCard extends StatelessWidget{

  Map data;
  ListCard(): super();
  List _list = [
    {
      'name': '跟进',
       'path': '/follow'
    },
    {
      'name': '转换',
       'path': '/transfer'
    },
    {
      'name': '更多',
      'path': 'flutter://transfer'
    }
  ];

  // 自定义 content 内容 一行三列 自动换行
  Widget _box( String  title , int index){
    return FractionallySizedBox(
        widthFactor: .333,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: (index % 3) != 0 ?  Border(
                  right:  BorderSide( width: 1, color:Color.fromRGBO(240, 240, 240, 0.8))
              ) : Border()
          ),
          child: Container(
            constraints: BoxConstraints(
                minHeight: 60
            ),
            padding: EdgeInsets.only(left: 8, right: 8),
            alignment: Alignment.center,
            child: Text(title.toString()),
          ),
        )
    );
  }


  List<Widget> _buildGrid(){
    List<Widget> list = [];
    for( var i= 0 ; i< data['children'].length ; i++) {
      list.add( _box(data['children'][i].keys.toList()[0], i +1));
    };
    return list;
  }

  Widget _footer(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('维护人：迪丽热巴'),
        Expanded(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _list.asMap().keys.map((index){
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, _list[index]['path']);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                  margin: EdgeInsets.only(right: 5),
                  child: Text(_list[index]['name'].toString(), style: TextStyle(fontSize: 14),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      border: Border.all(width: 1, color: Colors.grey)
                  ),
                ),
              );
            }).toList(),
          ),
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 5),
      child: CardComponent(
          title: '张大款',
          subTitle: '1级',
          expand: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                color: Colors.grey,
                child: Text('求购-新房'),
              ),
              SizedBox(width: 10.0,),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Text('求购-二手房'),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text('意向程度：'),
                          RatingBar(
                            itemSize: 24,
                            initialRating: 1, //初始评分 double
                            allowHalfRating: true,//允许0.5评分
                            itemCount: 5,//评分组件个数
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            onRatingUpdate: (rating) {
//                        setState(() {
//                          this.rate1=rating;
//                        });
                            },
                          )
                        ],
                      ),
                      height: 20,
                      alignment: Alignment.centerLeft,
                    ),

                    Container(
                      child: Text('看房次数：      3次'),
                      height: 20,
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text('最后跟进/带看时间：2020-04-20'),
                      height: 20,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
               Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (ctx){
                            return Center(
                              child: Material(
                                child: FractionallySizedBox(
                                  widthFactor: 0.9,
                                  child: Container(
                                    color: Colors.white,
                                    height: 180,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('去填写跟进'),
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(ctx);
                                                },
                                                child:  Icon(Icons.close),
                                              )

                                            ],
                                          ),
                                          height: 48.0,
                                        ),
                                        Text("拨打客户电话记得填写跟进哦～"),
                                        Container(
                                          height: 42,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Text('去填写', style: TextStyle(color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        );
                      },
                      child:  Container(
                        child: Icon(Icons.call, size: 28,color: Colors.blue),
                        height: 60,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text('倒计时(店淘)   5天'),
                    )
                  ],
                ),

            ],
          ),
          footer: _footer(context)
      ),
    );
  }
}




