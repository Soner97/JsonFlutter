import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_http/JsonPlaceHolder/json_place_holder.dart';
import 'package:http/http.dart' as http;
import 'package:json_http/JsonPlaceHolder/model/post_model.dart';

abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  List<PostModel> postModels = [];
  String errorMessage = "";
  bool isLoading = false;

  Future<void> getPosts() async {
    changeLoading();
    final response = await http.get("$baseUrl/posts");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          postModels = jsonBody
              .map((e) => PostModel.fromJson(e))
              .toList()
              .cast<PostModel>();
        break;
      default:
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Text(response.body),
          ),
        );
    }
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
