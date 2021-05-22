class Endpoint {
  const Endpoint();
  // Key for validation access to endpoint
  static const String key = "<<My key will be here>>";

  // Initialization of base URLs
  static const String baseUrl = "http://192.168.137.1:3000/api";
  static const String uplaod = "http://192.168.137.1:3000";

  // Initialisation of all other endpoints
  static const String allUsers = "/users/all";
  static const String oneUser = "/users/one";
  static const String allProducts = "/products/all";
  static const String oneProduct = "/products/one";
  static const String allPostes = "/postes";
}
