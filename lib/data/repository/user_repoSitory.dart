import 'package:dio/dio.dart';
import 'package:e_commerce/exports/all_exports.dart';

class UserRepository {
  final Dio _dio = Dio();
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
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error occured $error, stacktrace : $stacktrace");
      throw error;
    }
  }

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
