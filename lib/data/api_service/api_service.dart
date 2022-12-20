import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_dio_api/data/api_service/api_client.dart';
import 'package:shop_dio_api/data/models/category_model.dart';
import 'package:shop_dio_api/data/models/product_model.dart';

class ApiService extends ApiClient {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}/products");
      if (response.statusCode == 200) {
        return ((response.data)["data"] as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return [];
  }

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}/categories");
      if (response.statusCode == 200) {
        return (response.data as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return [];
  }
}
