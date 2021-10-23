import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/data/dio/interceptors.dart';
import 'package:e_commerce/model/enterprise/get_all_enterprises.dart';
import 'package:e_commerce/model/models_index.dart';

const upload = 'http://192.168.137.1:3050/images/';

class DataRepository {
  Dio _dio;

  // Initialisation of dio options
  DataRepository() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.137.1:3050/api",
        receiveDataWhenStatusError: true,
        connectTimeout: 1000 * 30, // 30 seconds
        receiveTimeout: 1000 * 30, // 30 seconds
      );
      _dio = Dio(options);
      _dio.interceptors.add(AppInterceptors());
    }
  }

  // Login contribuable
  Future<LoginResponse> loginUser(LoginSubmit loginSubmit) async {
    final result = await _dio.post(
      "/contribuable/signin",
      data: loginSubmit.toJson(),
    );
    return LoginResponse.fromJson(result.data);
  }

  // Signup contribuable
  Future<SignupResponse> signupContribuable(SignupSubmit signupSubmit) async {
    final result = await _dio.post(
      "/contribuable/signup",
      data: signupSubmit.toJson(),
    );
    return SignupResponse.fromJson(result.data);
  }

  // Update contribuable
  Future<SignupResponse> updateContribuable(
    ProfileSubmit profileSubmit,
    String id,
    File file,
  ) async {
    String fileName = file.path.split('/').last;
    FormData _formData = FormData.fromMap({
      ...profileSubmit.toJson(),
      "photo": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final result = await _dio.put(
      "/contribuable/update/$id",
      data: _formData,
    );
    return SignupResponse.fromJson(result.data);
  }

  Future<GetAllEnterprisesResponse> getAllEnterprises(int id) async {
    final result = await _dio.get(
      "/contribuable/all/$id",
    );
    return GetAllEnterprisesResponse.fromJson(result.data);
  }
}
