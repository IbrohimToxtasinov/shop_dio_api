import 'package:shop_dio_api/data/api_service/api_service.dart';
import 'package:shop_dio_api/data/models/category_model.dart';
import 'package:shop_dio_api/data/models/product_model.dart';

import '../models/album_model.dart';

class AppRepository {
  AppRepository({required this.apiService});
  ApiService apiService;
  Future<List<ProductModel>> getAllProducts() => apiService.getAllProducts();
  Future<List<CategoryModel>> getAllCategories() => apiService.getAllCategories();
}
