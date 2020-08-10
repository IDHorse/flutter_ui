import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/components/form_module/form_label_picker.dart';
import 'package:flutterappcrrm/components/form_module/form_page_picker.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/components/form_module/form_input.dart';
import 'package:flutterappcrrm/view_models/recommend_view_model.dart';
import 'package:flutterappcrrm/views/check_dynatown_page.dart';
import 'package:flutterappcrrm/views/city_picker_page.dart';
import 'package:flutterappcrrm/components/form_module/layout.dart';

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
        title: Text('推荐'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                BaseForm(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        height: 48.0,
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('客户信息',style: TextStyle(color: Colors.white, fontSize: 16.0) ),
                      ),
                      FormInput(
                        title: '客户姓名',
                        fieldKey: 'uname',
                        initialValue: '王鹏',
                      ),
                      FormInput(
                        title: '联系电话',
                        fieldKey: 'phone',
                        initialValue: '123123123',
                      ),
                      Container(
                        color: Colors.blue,
                        height: 48.0,
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('客户意向',style: TextStyle(color: Colors.white, fontSize: 16.0) ),
                      ),
                      FormLabelPicker(
                        title: '租售',
                        fieldKey: 'intention'
                      ),
                      FormPagePicker(
                        title: '城市',
                        fieldKey: 'city',
                        initialValue: '123123123',
                        child: CityPicker(),
                      ),
                      FormInput(
                        title: '区域',
                        fieldKey: 'region',
                        initialValue: '王鹏',
                      ),
                      FormPagePicker(
                        title: '意向楼盘',
                        fieldKey: 'building',
                        initialValue: '123123123',
                        child: CityPicker(),
                      ),
                      FormPagePicker(
                        title: '选择置业顾问',
                        fieldKey: 'building',
                        initialValue: '123123123',
                        child: DyantownPage()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              var values = _formKey.currentState.getFieldsValue();
              print(values);
            },
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
