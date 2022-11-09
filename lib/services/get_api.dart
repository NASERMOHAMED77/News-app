import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'article-model.dart';

class Api {
  Future<List<Article>> getdata(String categoryName) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=9273e8c3654242b380ed9fdbba8f8254&category=$categoryName'));
    if (response.statusCode == 200) {
      List<dynamic> x = json.decode(response.body)['articles'];
      List<Article> xx = x.map((e) => Article.fromjson(e)).toList();

      return xx;
    } else {
      throw Exception('c');
    }
  }
}
