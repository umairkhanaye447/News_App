import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/CategoriesNewsModel.dart';
import 'package:news_app/Model/NewsChannelModel.dart';

class NewsRepository {
  Future<NewsChannelModel> fetchNewChannelHeadlineApi(String channel) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channel&apiKey=2eb509f99db14f75b1322f9ea97296b5';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelModel.fromJson(body);
    }
    throw Exception('error');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String categroies) async {
    String url =
        'https://newsapi.org/v2/everything?q=$categroies&apiKey=2eb509f99db14f75b1322f9ea97296b5';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('error');
  }
}
