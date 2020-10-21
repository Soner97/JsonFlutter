import 'package:flutter/material.dart';
import 'package:json_http/JsonPlaceHolder/model/post_model.dart';
import 'json_place_holder_view_model.dart';

class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? CircularProgressIndicator()
            : Text("Json Place Holder View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPosts();
        },
      ),
      body: ListView.builder(
        itemCount: postModels.length,
        itemBuilder: (context, index) => Text(postModels[index].title),
      ),
    );
  }
}
