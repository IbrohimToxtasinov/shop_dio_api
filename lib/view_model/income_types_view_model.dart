import 'package:flutter/foundation.dart';
import 'package:shop_dio_api/data/api_service/api_service.dart';
import 'package:shop_dio_api/data/models/income_types_model.dart';
import 'package:shop_dio_api/data/repository/app_repository.dart';

class IncomeTypesViewModel extends ChangeNotifier {
  IncomeTypesViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  String errorForUI = "";

  bool isLoading = false;

  List<IncomeTypes>? incomeTypes;

  fetchAllIncomeTypes() async {
    MyResponse myResponse = await _appRepository.getAllIncomeTypes();

    if (myResponse.error.isEmpty) {
      incomeTypes = myResponse.data as List<IncomeTypes>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
