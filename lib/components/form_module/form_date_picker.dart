import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappcrrm/components/form_module/form_item.dart';
import 'package:flutterappcrrm/components/form_module/index.dart';


class DateLabelBean {
  String label;
  dynamic value;

  DateLabelBean({this.label, this.value});
}

// ignore: must_be_immutable
class BuildPicker extends StatefulWidget {
  FixedExtentScrollController _fixedExtentScrollController;
  List data;
  Function onSelectedItemChanged;
  double itemExtent;
  int initialValue;

  BuildPicker({
    Key key,
    @required this.data,
    this.itemExtent = 36.0,
    this.initialValue,
    this.onSelectedItemChanged
  }): super(key:key);

  @override
  BuildPickerState createState() => BuildPickerState();
}
class BuildPickerState extends State<BuildPicker> {

  @override
  void initState() {
    super.initState();
    int index = widget.data.indexWhere( (element)=> element.value == widget.initialValue);
    widget._fixedExtentScrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      useMagnifier: true,
      scrollController: widget._fixedExtentScrollController,
      backgroundColor: Colors.white,
      children: widget.data.map((item) {
        return Center(
          child: Text(
            item.label.toString(),
            style: TextStyle(color: Colors.black87, fontSize: 16),
            maxLines: 1,
          ),
        );
      }).toList(),
      onSelectedItemChanged: (index)=>widget.onSelectedItemChanged(widget.data[index]),
      itemExtent: widget.itemExtent,
    );
  }


//  @override
//  void dispose() {
//    super.dispose();
//    widget._fixedExtentScrollController.dispose();
//  }

}

// ignore: must_be_immutable
class FormDatePicker extends BaseFormFiled<String> {

  //初始化控制器
  FixedExtentScrollController provinceScrollController = FixedExtentScrollController();
  final int maxYear;
  final int minYear;
  // 定义 controller
  FormDatePicker( {
    Key key,
    String initialValue,
    String placeholder = '请选择',
    String fieldKey,
    String title,
    this.maxYear = 2030,
    this.minYear = 2000,
  }): super(
      key: key,
      fieldKey: fieldKey,
      initialValue: initialValue,
      placeholder: placeholder,
      builder: (field) {
        final _FormDatePickerState state = field;
        return FormItem(
            title: title,
            child: GestureDetector(
              onTap: () async {
                /// 第一步 获取当前的年 月 日 时 分 确定默认值 和 基础数据
                /// year 上下 共计 30年 1930 - 2020
                showModalBottomSheet(
                    context: field.context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              state._buildHeader(),
                              state._buildContentView()
                            ],
                          ),

                      );
                    });
              },
              child: Text( field.value !=null && field.value !="" ? field.value : field.placeholder, textAlign: TextAlign.right,),
            )
        );
      }
  );

  @override
  _FormDatePickerState createState() => _FormDatePickerState();

}

class _FormDatePickerState extends BaseFormFiledState<String> {

  DateTime date =  DateTime.now(); /// 当前的时间

  /// 默认值
  int _year;
  int _month;
  int _day;
  int _hour;
  int _minute;

  /// 渲染数据
  List _yearList = [];
  List _mouthList = [];
  List _dayList = [];
  List _hourList = [];
  List _minuteList = [];


  /// 改变数据
  _changeDay(month){
    /// 1 3 5 7 8 10 12 ==> 31
    /// 2 => 28 / 29
    /// 4 6 9 11 ==> 30
    _dayList.clear();
    if([1,3, 5, 7, 8, 10, 12].contains(month)){
      for(int i = 1; i<= 31 ; i++){
        _dayList.add(DateLabelBean(label: "${i}日", value: i));
      }
    }
    if([4,6, 9, 11].contains(month)){
      for(int i = 1; i<= 30 ; i++){
        _dayList.add(DateLabelBean(label: "${i}日", value: i));
      }
    }
    if(month == 2){
      if( date.year%4==0&&date.year%100!=0||date.year%400==0){
        for(int i = 1; i<= 29 ; i++){
          _dayList.add(DateLabelBean(label: "${i}日", value: i));
        }
      }else{
        for(int i = 1; i<= 28 ; i++){
          _dayList.add(DateLabelBean(label: "${i}日", value: i));
        }
      }
    }

    /// end
  }
  _changeMonth(){
    for(int i = 1; i<= 12 ; i++){
      _mouthList.add(DateLabelBean(label: "${i}月", value: i));
    }
  }
  _changeYear(){
    for(int i = widget.minYear; i<= widget.maxYear ; i++){
      _yearList.add(DateLabelBean(label: "${i}年", value: i));
    }
  }
  _changeHour(){
    for(int i = 0; i<= 23 ; i++){
      _hourList.add(DateLabelBean(label: "${i}时", value: i));
    }
  }
  _changeMinute(){
    for(int i = 0; i<= 59 ; i++){
      _minuteList.add(DateLabelBean(label: "${i}分", value: i));
    }
  }


  ///  创建头部
  _buildHeader() {
    return Container(
      height: 42,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("取消"),
          Text("title"),
          InkWell(
            onTap: (){
              String str = "${_year}-${_month}-${_day} ${_hour}:${_minute}";
              didChange(str);
              Navigator.pop(context);
            },
            child:  Text("确定"),
          )
        ],
      ),
    );
  }

  _handleClick(String key, DateLabelBean bean){
    if(key == 'year') _year = bean.value;

    if(key == "month") {
      _month = bean.value;
      _changeDay(bean.value);
    }
    if(key == "day") _day = bean.value;
    if(key == "hour") _hour = bean.value;
    if(key == "minute") _minute = bean.value;
  }

  /// 创建主体
  _buildContentView(){
    return  Container(
      height: 260,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded( child:  BuildPicker(data: _yearList, initialValue: _year, onSelectedItemChanged: (item)=> _handleClick("year", item))),
          Expanded( child:  BuildPicker(data: _mouthList, initialValue: _month,onSelectedItemChanged: (item)=> _handleClick("month", item))),
          Expanded( child:  BuildPicker(data: _dayList, initialValue: _day, onSelectedItemChanged: (item)=> _handleClick("day", item))),
          Expanded( child:  BuildPicker(data: _hourList, initialValue: _hour, onSelectedItemChanged: (item)=> _handleClick("hour", item))),
          Expanded( child:  BuildPicker(data: _minuteList, initialValue: _minute, onSelectedItemChanged: (item)=> _handleClick("minute", item))),
        ],
      ),
    );
  }

  @override
  FormDatePicker get widget => super.widget; // 获取关联上下文widght


  @override
  void initState() {
    super.initState();

    _changeYear();
    _changeMonth();
    _changeDay(date.month); /// 依靠月份判断日区间
    _changeHour();
    _changeMinute();


    ///  设置默认值
    _year = date.year;
    _month = date.month;
    _day = date.day;
    _hour = date.hour;
    _minute = date.minute;

  }




}