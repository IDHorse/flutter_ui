import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/form_module/form_input.dart';
import 'package:flutterappcrrm/view_models/recommend_view_model.dart';

class RecommendPage extends StatefulWidget {

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends BaseState<RecommendPage, RecommendViewModel> {
  final GlobalKey<BaseFormState>  _formKey= new GlobalKey<BaseFormState>();

  @override
  void onReady(RecommendViewModel viewModel) {

  }
  @override
  RecommendViewModel setViewModel()=>RecommendViewModel();

  @override
  Widget builder(BuildContext context, RecommendViewModel viewModel, Widget child) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('推荐')
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 48.0,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text('客户信息',style: TextStyle(color: Colors.white, fontSize: 16.0) ),
                ),

                BaseForm(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FormInput(
                        fieldKey: 'username',
                        initialValue: '王鹏',
                      ),


                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                   print( _formKey.currentState.getFiledValue('username'));

                  },
                  child: Text('点击测试'),
                )

              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: 48.0,
              width: double.infinity,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('完成推荐', style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ),
          )

        ],
      ),
    );
  }


}
