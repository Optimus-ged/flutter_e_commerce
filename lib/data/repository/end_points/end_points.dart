class Endpoint {
  const Endpoint();
  // Key for validation access to endpoint
  static const String key = "<<My key will be here>>";

  // Initialization of base URLs
  static const String baseUrl = "http://192.168.137.1:3030/api";
  static const String uplaod = "http://192.168.137.1:3030/";

  // Initialisation of all other endpoints
  static const String allUsers = "/users/all";
  static const String signUp = "/users/one";
  static const String allArticles = "/article";
  static const String oneProduct = "/products/one";
  static const String allPostes = "/postes";
  static const String loginUser = "/users/signin";
  static const String signUpUser = "/users/signup";
}
