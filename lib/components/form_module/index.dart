import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';


/// 关于form的所有动作 都在这里  数据集中处理在这个类
class FormBloc  {


  final Map < String, BaseFormFiledState> _fields = <String, BaseFormFiledState > {};

  // ignore: close_sinks
  final __streamController = PublishSubject();
  Stream get __stream =>__streamController.stream;


  void didChanged(String data){
    __streamController.sink.add(data);
  }

  void _registerFiled( BaseFormFiledState field, String key) {
//    if( _fields.containsKey(key))  throw FormatException('key已经存在');
    _fields[key] = field;
  }

  getFieldValue(String key)  => _fields[key].value;
  getFieldsValue() {
    return _fields.map( (key, value){
        return new MapEntry(key, value.value);
    });
  }


  dispose(){
    __streamController.close();
    _fields.clear();
  }

}


class BlocProvider extends InheritedWidget {

  final Widget child;
  final FormBloc formBloc;

  BlocProvider({
    this.child,
    this.formBloc,
  }): super();

  static BlocProvider of(BuildContext context) =>
      // ignore: deprecated_member_use
      context.inheritFromWidgetOfExactType(BlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}

// ignore: must_be_immutable
class BaseForm extends StatefulWidget {
  final Widget child;

  Function onChanged;
  BaseForm({
    Key key,
    this.onChanged,
    @required this.child })
      : assert( child != null),
        super(key: key);
  @override
  BaseFormState createState() => BaseFormState();

}
class BaseFormState extends State<BaseForm> {

  FormBloc _formBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formBloc = FormBloc();
  }


  getFieldValue(String key) => _formBloc.getFieldValue(key);
  getFieldsValue() => _formBloc.getFieldsValue();


  void _fieldDidChange() {
    if (widget.onChanged != null)
      widget.onChanged();
//    _forceRebuild();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      formBloc: _formBloc,
      child: StreamBuilder(
          stream: _formBloc.__stream,
          builder: (context, snapshot) {
            return widget.child;
          }
      ),
    );
  }

  @override
  void dispose() {
    _formBloc.dispose();
    super.dispose();
  }
}

class BaseFormFiled<T> extends StatefulWidget {
  final initialValue;
  final bool enable;
  final String fieldKey;
  final Widget Function(BaseFormFiledState field) builder;
  final void Function() onSave;

  const BaseFormFiled({
    Key key,
    @required this.fieldKey,
    this.enable = true,
    this.initialValue,
    this.builder,
    this.onSave
  }) : super(key: key);

  @override
  BaseFormFiledState createState() => BaseFormFiledState();
}

class BaseFormFiledState<T> extends State<BaseFormFiled<T>> {

  T _value;

  T get value => _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;  /// 初始化默认值
  }

  @protected
  void save() {

  }
  @protected
  void setValue(T newValue) {   /// 更新值
    _value = newValue;
  }

  void didChange(T value) {
    setState(() {
      _value = value;
    });
//    Form.of(context)?._fieldDidChange();
  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of(context).formBloc._registerFiled(this, widget.fieldKey);
    return widget.builder(this);
  }

}