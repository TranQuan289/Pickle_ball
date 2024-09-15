import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pickle_ball/services/api_config.dart';
import '../models/campaign_model.dart';

class CampaignService {
  static const String baseUrl = ApiConfig.baseUrl;

  Future<List<Tournament>> getCampaign(int campaignId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/campaign/$campaignId'),
      headers: {'accept': '*/*'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> dataList = json.decode(response.body);
      if (dataList.isNotEmpty) {
        return dataList.map((json) => Tournament.fromJson(json)).toList();
      } else {
        throw Exception('No data available');
      }
    } else {
      throw Exception('Failed to load campaign');
    }
  }
}
