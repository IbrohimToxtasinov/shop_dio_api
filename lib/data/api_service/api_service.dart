import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_dio_api/data/api_service/api_client.dart';
import 'package:shop_dio_api/data/models/category_model.dart';
import 'package:shop_dio_api/data/models/income_types_model.dart';
import 'package:shop_dio_api/data/models/product_model.dart';
import 'package:shop_dio_api/data/models/transactions_expenses/transactions_expenses_model.dart';

class MyResponse {
  MyResponse({
    this.data,
    required this.error,
  });

  dynamic data;
  String error = "";
}

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

Future<MyResponse> getAllTransactionsExpenses() async{

    MyResponse myResponse = MyResponse(error: "");
    try{
      Response response = await  dio.get("${dio.options.baseUrl}/transactions-expenses");
      if(response.statusCode == 200){
        myResponse.data = (response.data as List?)?.map((e) => TransactionsExpenses.fromJson(e)).toList()??[];
      }

    } catch(error){
      myResponse.error = error.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getAllIncomeTypes() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => IncomeTypes.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse = MyResponse(
        error: error.toString(),
      );
    }
    return myResponse;
  }
}
