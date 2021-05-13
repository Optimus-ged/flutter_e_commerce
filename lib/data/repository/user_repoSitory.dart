import 'package:dio/dio.dart';
import 'package:e_commerce/exports/all_exports.dart';

class UserRepository {
  final Dio _dio = Dio();
  Future<UserResponse> getUsers() async {
    try {
      Response response = await _dio.get("http://192.168.137.1:3000/api/users/all");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error occured $error, stacktrace : $stacktrace");
      throw error;
    }
  }
}
