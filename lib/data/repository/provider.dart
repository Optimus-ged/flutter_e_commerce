import 'package:dio/dio.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/user_model/signup_response.dart';

class Provider {
  Dio _dio;

  // Initialisation of dio options
  Provider() {
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

  // Login
  Future<LoginResponse> loginUser(String nom, String password) async {
    try {
      final result = await _dio.post(
        "${Endpoint.loginUser}",
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

  // Signup
  Future<SignUpResponse> signUp(
      {@override File file, @override Users userData}) async {
    String fileName = file.path.split('/').last;
    try {
      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(file.path, filename: fileName),
        "nom": userData.nom,
        "contact": userData.contact,
        "mot_de_passe": userData.motDePasse
      });
      var response = await _dio.post(
        "${Endpoint.signUpUser}",
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      print(response.data);
      return SignUpResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("uploadImage error : $error, stacktrace : $stacktrace");
      throw error;
    }
  }

  // Signup
  Future<SignUpResponse> updateUser(
      {@override File file, @override Users userData}) async {
    String fileName = file.path.split('/').last;
    try {
      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(file.path, filename: fileName),
        "nom": userData.nom,
        "contact": userData.contact,
        "mot_de_passe": userData.motDePasse
      });
      var response = await _dio.post(
        "${Endpoint.updateUser}/${userData.id}",
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      print(response.data);
      return SignUpResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("uploadImage error : $error, stacktrace : $stacktrace");
      throw error;
    }
  }

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
      print("GetUsers error : $error, stacktrace : $stacktrace");
      throw error;
    }
  }

  // Handling get request for all articles
  Future<ListeArticles> getArticles(String token) async {
    try {
      Response response = await _dio.get(
        "${Endpoint.allArticles}",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            "Authorization": "$token",
          },
        ),
      );
      return ListeArticles.fromJson(response.data);
    } catch (error, stacktrace) {
      print("GetArticles error : $error, stacktrace : $stacktrace");
      throw error;
    }
  }
}
