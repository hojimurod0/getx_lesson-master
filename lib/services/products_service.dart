import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:getx_lesson/models/product_model.dart';

class ProductsService {
  final Dio dio = Dio();

  Future<ProductModel?> fetchProducts() async {
    final url = "https://fakestoreapi.in/api/products";
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      }
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
