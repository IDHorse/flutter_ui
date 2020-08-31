import 'dart:convert';

import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:flutterappcrrm/entity/base_entity.dart';

/// 历史记录model
class NotesModel {
  String title;

}

class AddCustomerVM extends BaseViewModel {

  List<NotesModel> notes;

  /// 获取用户
  getCustomer(String msg){

  }

  /// 获取记录
  getNotes() {
//    var map = new Map<String, dynamic>();
//    base_entity result  = await HttpClient.getInstance().post('/vinci/category/list',  map );
//      BaseEntity result  = BaseEntity.fromJson(jsonDecode({
//        "data":
//      }));
//
//
//    if(result.data != null){
//      (result.data as List).forEach( (v){ orderCategory.add(OrderCategoryModel.fromJson(v));} );
//    }
  }


  /// 删除历史记录
  deleteNotes(){

  }

}