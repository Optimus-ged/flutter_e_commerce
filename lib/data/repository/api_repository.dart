import 'package:dio/dio.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/exports/all_exports.dart';

class ApiRepository {
  final Provider _apiProvider = Provider();

  Future<LoginResponse> loginUser(String nom, String password) =>
      _apiProvider.loginUser(nom, password);
}
