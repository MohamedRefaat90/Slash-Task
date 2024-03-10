import 'package:dio/dio.dart';

class ApiHandler {
  final Dio _dio = Dio();

  String endPoint = "https://slash-backend.onrender.com/product";

  Future<List> getAllProduct() async {
    var response = await _dio.get(endPoint);

    return response.data['data'];
  }

  Future<Map<String, dynamic>> getProductDetails(int productID) async {
    var response = await _dio.get("$endPoint/$productID");

    return response.data['data'];
  }
}
