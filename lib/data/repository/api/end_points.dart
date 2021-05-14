class Endpoint {
  const Endpoint();
  // Key for validation access to endpoint
  static const String key = "<<My key will be here>>";

  // Initialization of base URLs
  static const String baseUrl = "http://192.168.137.1:3000/api";

  // Initialisation of all other endpoints
  static const String allUsers = "$baseUrl/users/all";
  static const String oneUser = "$baseUrl/users/one";
  static const String allProducts = "$baseUrl/products/all";
  static const String oneProduct = "$baseUrl/products/one";
  static const String allPostes = "$baseUrl/postes";
}
