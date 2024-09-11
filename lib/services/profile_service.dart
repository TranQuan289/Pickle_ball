import 'package:dio/dio.dart';
import 'package:pickle_ball/models/user_profile_model.dart';
import 'dart:io';

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

  Future<String?> uploadImage(File image) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, filename: fileName),
      });

      final response = await _dio.post(
        '$_baseUrl/image/upload',
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      if (response.statusCode == 200) {
        return response.data['url'];
      }
    } catch (e) {
      throw Exception('Failed to upload image');
    }
    return null;
  }
}
