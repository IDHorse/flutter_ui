
import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/base/base_view.dart';
import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:provider/provider.dart';


abstract class BaseState< V extends StatefulWidget, VM extends BaseViewModel > extends State<V> with AutomaticKeepAliveClientMixin implements BaseView {


  VM _vm;
  VM setViewModel();   //设置要使用的viewModel
  bool isLoading = false;
  void onReady(VM viewModel);
  Widget builder( BuildContext context, VM _vm, Widget child );

  @override
  void initState() {
    super.initState();
    _vm = setViewModel();   ///初始化 viewModel
    onReady(_vm);
  }

  //  context

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<VM>(
      create: (_) => _vm,
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