import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pickle_ball/models/news_model.dart';

class NewsService {
  static const String _baseUrl = 'http://apis-pickleball.runasp.net/api';

  Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse('$_baseUrl/newarticle'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
