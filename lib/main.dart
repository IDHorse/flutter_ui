import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'App.dart';

void main(){
  runApp(App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


