
import 'package:flutterappcrrm/base/base_view_model.dart';
import 'package:flutterappcrrm/entity/TypeTab.dart';

class MyRecommendViewModel extends BaseViewModel {


  final List<TypeTab> typeTabs =  <TypeTab> [
    TypeTab("待处理", "wii"),
    TypeTab("处理中", "ing"),
    TypeTab("已成交", "done"),
    TypeTab("已失效", "over"),
  ];


}