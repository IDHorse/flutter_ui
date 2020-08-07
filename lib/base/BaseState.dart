import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/base/BaseViewModel.dart';
import 'package:flutterappcrrm/base/IBaseView.dart';
import 'package:provider/provider.dart';


abstract class BaseState< V extends StatefulWidget, VM extends BaseViewModel > extends State<V> implements IBaseView {


  VM viewModel;
  VM setViewModel();   //设置要使用的viewModel
  bool isLoading = false;
  void onReady(VM viewModel);
  Widget  builder( BuildContext context, VM viewModel, Widget child );

  @override
  void initState() {
    super.initState();
    viewModel = setViewModel();   ///初始化 viewModel
    onReady(viewModel);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>(
      create: (_) => viewModel,
      child:  Consumer<VM>(
        builder: (BuildContext context, VM viewModel, Widget child) =>  builder(context, viewModel, child) ,
      ),
    );
  }


  @override
  showLoading() {
    setState(() {
      isLoading = true;
    });
    return null;
  }


  @override
  hideLoading() {
    setState(() {
      isLoading = false;
    });
    return null;
  }

}