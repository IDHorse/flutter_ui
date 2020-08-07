import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/BaseState.dart';
import 'package:flutterappcrrm/view_models/senior_view_model.dart';

class SeniorPage extends StatefulWidget{
  @override
  _SeniorPageState createState() => _SeniorPageState();
  
}

class _SeniorPageState extends BaseState<SeniorPage, SeniorViewModel> {
  
  @override
  void onReady(viewModel) {
  // TODO: implement onReady
  }
  
  @override
  setViewModel()=> SeniorViewModel();
  
  @override
  Widget builder(BuildContext context, viewModel, Widget child) {
    // TODO: implement builder
    return MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 220.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    viewModel.imgUrl, fit: BoxFit.fill,),
                ),
              ),
            ]
        ),
    ));
  }

 
  
}