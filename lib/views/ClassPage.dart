import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/components/base_classify_title.dart';
import 'package:flutterappcrrm/components/base_shadow_card.dart';
import 'package:flutterappcrrm/view_models/class_view_model.dart';
import 'package:pigment/pigment.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState()=> _ClassPageState();
}
class _ClassPageState extends BaseState<ClassPage, ClassViewModel> {


  PageController _pageController;
  ScrollController _scrollController;


  /// 监听页面滚动事件
  void registerScroll () {
//    print(_scrollController.offset.toString());
  }


  @override
  void onReady(viewModel) {
    // 初始化 _pageController
    _pageController = PageController();
    _scrollController = ScrollController();

    _scrollController.addListener( this.registerScroll );

  }

  @override
  setViewModel() => ClassViewModel();


  @override
  Widget builder(BuildContext context, viewModel, Widget child) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: Pigment.fromString('#f3f6f9'),
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child : Container(
                        height: 36.0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 20.0),
                        color: Pigment.fromString('#d8dadc'),
                        child: Text('React Vue Angularjs', style: TextStyle( color:  Pigment.fromString('#71777D'))),
                      ),
                    ),
                    Icon(Icons.message)
                  ],
                ),
                Container(
                  height: 150.0,
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: viewModel.imgs.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image(
                            image: NetworkImage( viewModel.imgs[index]),
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                  ),
                ),
                BaseShadowCard(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/senior');
                      },
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 58,
                                  child: Row(
                                    children: <Widget>[
                                      ClipRRect(
                                          child: Image.network("http://profile.csdnimg.cn/B/C/5/2_idhorse",
                                              fit: BoxFit.cover, width: 40, height: 40),
                                          borderRadius: BorderRadius.circular(40)
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('前浪直言')
                                      )

                                    ],
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.play_circle_outline, size: 20.0),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child:Text('第三十期 | 为什么总觉得自己是对的', style: TextStyle(
                                        color: Colors.grey
                                    ))
                                )
                              ],
                            ),
                          ],
                      )
                    )
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        ClassifyTitle(
                          title: '即刻Live',
                          trailing: Row(
                            children: <Widget>[
                              Icon(Icons.access_alarms),
                              Text('08月05日 20：00')
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          color: Colors.white,
                          height: 130.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                        image: NetworkImage('https://assets.jikexueyuan.com/user/avtar/201510/28/00/2uka3vayyio0g.jpeg'),
                                        fit: BoxFit.fill
                                    )
                                ),
                                width: 100.0,
                                height: 100.0,
                                margin: EdgeInsets.only(right: 15.0),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('丁雪峰：学习新框架的最佳方式', style: TextStyle( fontSize: 16.0)),
                                    Text('平安壹钱包，资深架构师，告诉你怎样高效学习新框架', style: TextStyle( fontSize: 12.0, color: Colors.grey)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('直播预告'),
                                        InkWell(
                                          onTap: (){},
                                          child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(6.0),
                                              ),
                                              child: Text('预约直播', style: TextStyle( fontSize: 12.0, color: Colors.white))
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        ClassifyTitle(
                          title: '极客大学',
                          trailing: Text('查看全部'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          color: Colors.white,
                          height: 410.0,
                          width: double.infinity,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:5/6,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                            itemBuilder:(context, index) {
                              var date = DateTime.fromMillisecondsSinceEpoch(1596988800000);
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(6.0),
                                          image: DecorationImage(
                                              image: NetworkImage('https://static001.geekbang.org/resource/image/15/9b/1546bb02242995f71056c34ba10bf59b.jpg'),
                                              fit: BoxFit.fitWidth
                                          )
                                      ),
                                      width: double.infinity,
                                      height: 100.0,
                                    ),
                                    Text('算法训练营'),
                                    Text('70天刻意练习，学会才是终点', style: TextStyle(fontSize: 12.0),),
                                    Text('覃超，前 Facebook 工程师', style: TextStyle(fontSize: 12.0)),
                                    Text('第14期，${date.month}月${date.day}日开课', style: TextStyle(fontSize: 12.0))
                                  ]
                                )
                              );
                            }
                          ),
                        ),
                        Divider()
                      ],
                    )
                )


              ],
            ),
          ),
        ],
      )

    );
  }




}