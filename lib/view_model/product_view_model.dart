import 'package:flutter/foundation.dart';
import 'package:shop_dio_api/data/models/product_model.dart';
import 'package:shop_dio_api/data/repository/app_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  ProductsViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  bool isLoading = false;

  List<ProductModel>? productModel;

  fetchAllProducts() async {
    notify(true);
    productModel = await _appRepository.getAllProducts();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}