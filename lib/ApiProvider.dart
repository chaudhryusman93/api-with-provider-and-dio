import 'dart:convert';

import 'package:api_with_dio/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class ApiProvider with ChangeNotifier {
  List<Post> _list = [];
  List<Post> get list => _list;
  bool isLoading = true;

  static const String apiKey = 'https://jsonplaceholder.typicode.com/posts';
  final Dio dio = Dio();

  fetchData() async {
    try {
      Response response = await dio.get(apiKey);
      if (response.statusCode == 200) {
        _list =
            (response.data as List).map((data) => Post.fromJson(data)).toList();
        _list = list;
        notifyListeners();
      }
    } catch (error) {
      Text(error.toString());
      print(error);
    }
    isLoading = false;
  }
}
