import 'package:flutter/foundation.dart';
import 'package:shop_dio_api/data/models/category_model.dart';
import 'package:shop_dio_api/data/repository/app_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  bool isLoading = false;

  List<CategoryModel>? categories;

  fetchAllCategories() async {
    notify(true);
    categories = await _appRepository.getAllCategories();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
