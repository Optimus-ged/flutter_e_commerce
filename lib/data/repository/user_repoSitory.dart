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
      print("${response.data}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error occured $error, stacktrace : $stacktrace");
      throw error;
    }
  }
}
