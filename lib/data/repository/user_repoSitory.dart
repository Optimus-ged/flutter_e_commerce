import 'package:dio/dio.dart';
import 'package:e_commerce/data/dio/interceptors.dart';
import 'package:e_commerce/exports/all_exports.dart';

class UserRepository {
  Dio _dio;

  // Initialisation of dio options
  UserRepository() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: "${Endpoint.baseUrl}",
        receiveDataWhenStatusError: true,
        connectTimeout: 1000 * 30, // 30 seconds
        receiveTimeout: 1000 * 30, // 30 seconds
      );
      _dio = Dio(options);
      _dio.interceptors.add(AppInterceptors());
    }
  }

  // Handling get request for all users
  Future<UserResponse> getUsers(String token) async {
    try {
      Response response = await _dio.get(
        "${Endpoint.allUsers}",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            "Authorization": "$token",
          },
        ),
      );

      print("${response.statusCode} BBBBBBBBBBBBBBBBBBBBBBB ${response.data}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error occured : $error, stacktrace : $stacktrace");
      throw error;
    }
  }

  // Handling post request for users
  Future<UserResponse> signUp(String token, Users user) async {
    try {
      Response response = await _dio.post(
        "${Endpoint.oneUser}",
        data: user.toJson(),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "Application/json",
            "Authorization": "$token",
          },
        ),
      );
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("An error occured : $error stacktrace : $stacktrace");
      throw error;
    }
  }
}
