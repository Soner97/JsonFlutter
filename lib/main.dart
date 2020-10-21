import 'package:flutter/material.dart';
import 'package:json_http/JsonPlaceHolder/json_place_holder.dart';
import 'package:json_http/JsonPlaceHolder/json_place_holder_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: JsonPlaceHolder(),
    );
  }
}
