import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';



class CreateCustomerVM extends BaseViewModel {

  List<Map<String, dynamic>> options;
  List<Map<String, dynamic>> options1 = [
    {"label": "求购新房", "value": 1},
    {"label": "求购二手房", "value": 2},
    {"label": "求购法拍房", "value": 3}
  ];


  List<Map<String, dynamic>> options2 = [
    {"label": "求租", "value": 0},
  ];


  final GlobalKey<BaseFormState>  formKey = new GlobalKey<BaseFormState>();


  handleSetIntentionType(){   /// 修改

    List<dynamic> _v = formKey.currentState.getFieldValue("buyRent");

    if(_v[0] == 2) {  /// 求租
      formKey.currentState.setFieldValue("intentionType", [0]);
      formKey.currentState.setFieldEnable("intentionType", false);
      options = options2;
      notifyListeners();
    }else {
      formKey.currentState.setFieldValue("intentionType", []);
      formKey.currentState.setFieldEnable("intentionType", true);
      options = options1;
      notifyListeners();
    }
  }

}