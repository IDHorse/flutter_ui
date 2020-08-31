


import 'package:flutter/cupertino.dart';

class TextArea extends FormField<String> {

  TextArea({
    Key key
  }): super(
    key: key,
    builder: (filed) {
      return Text('这是textarea');
    }
  );

  @override
  _TextAreaState createState() =>_TextAreaState ();
}

class _TextAreaState  extends FormFieldState<String>  {

}
