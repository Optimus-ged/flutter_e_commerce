import 'package:dio/dio.dart';
import 'package:e_commerce/exports/all_exports.dart';

class UserRepository {
  final Dio _dio = Dio();
  Future<UserResponse> getClients() async {
    try {
      Response response = await _dio.get("${Endpoint.allUsers}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error occured $error, stacktrace : $stacktrace");
    }
  }
}
