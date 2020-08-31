import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';
import 'package:flutterappcrrm/entity/base_entity.dart';



class UpdateCustomerVM extends BaseViewModel {


  final GlobalKey<BaseFormState>  formKey = new GlobalKey<BaseFormState>();


  handleSetIntentionType(){   /// 修改

    List<dynamic> _v = formKey.currentState.getFieldValue("buyRent");

    if(_v[0] == 2) {  /// 求租
      formKey.currentState.setFieldValue("intentionType", [0]);
      formKey.currentState.setFieldEnable("intentionType", false);
    }else {
      formKey.currentState.setFieldValue("intentionType", []);
      formKey.currentState.setFieldEnable("intentionType", true);
    }
  }

}