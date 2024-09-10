import 'package:dio/dio.dart';
import 'package:pickle_ball/models/user_profile_model.dart';

class ProfileService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://apis-pickleball.runasp.net/api';

  Future<UserProfile> getUserProfile(int userId) async {
    try {
      final response = await _dio.get('$_baseUrl/users/$userId');
      return UserProfile.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }

  Future<void> updateUserProfile(int userId, Map<String, dynamic> data) async {
    try {
      final formData = FormData.fromMap(data);
      await _dio.put('$_baseUrl/users/$userId', data: formData);
    } catch (e) {
      throw Exception('Failed to update user profile');
    }
  }
}
