import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:e_commerce/ngango_lib/model/all_clients_model.dart';
import 'package:e_commerce/ngango_lib/model/login.dart';
import 'connection_settings/n_interceptors.dart';


class NProvider {
  Dio _dio;

  // Initialisation of dio options
  NProvider() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.137.1:3535/api",
        receiveDataWhenStatusError: true,
        connectTimeout: 1000 * 30, // 30 seconds
        receiveTimeout: 1000 * 30, // 30 seconds
      );
      _dio = Dio(options);
      _dio.interceptors.add(AppInterceptors());
    }
  }

  // Login
  Future<LoginResponse> loginUser(String nom, String password) async {
    try {
      final result = await _dio.post(
        "/agents/signin",
        data: {"nom": nom, "mot_de_passe": password},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            // "App": "Admin",
            // "key": Endpoint.key
          },
        ),
      );
      return LoginResponse.fromJson(result.data);
    } catch (e) {
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
  }

  // Login
  Future<AllAgents> getAllAgents() async {
    try {
      final result = await _dio.get(
        "/agents",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            // "App": "Admin",
            // "key": Endpoint.key
          },
        ),
      );
      return AllAgents.fromJson(result.data);
    } catch (e) {
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
  }

  // Login
  Future<ClientsModel> getAllClients() async {
    try {
      final result = await _dio.get(
        "/clients",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            // "App": "Admin",
            // "key": Endpoint.key
          },
        ),
      );
      return ClientsModel.fromJson(result.data);
    } catch (e) {
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
  }

   // Login
  Future<CreateAgent> postAgent({File file, CreateAgent agentData}) async {
    String fileName = file.path.split('/').last;
    try {
      FormData formData = FormData.fromMap({
        ...agentData.toJson(),
        "photo": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final result = await _dio.post(
        "/agents/signup",
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            // "App": "Admin",
            // "key": Endpoint.key
          },
        ),
      );
      return CreateAgent.fromJson(result.data);
    } catch (e) {
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
  }
}

final myProvider = NProvider();
