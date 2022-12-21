import 'package:flutter/foundation.dart';
import 'package:shop_dio_api/data/api_service/api_service.dart';
import 'package:shop_dio_api/data/models/transactions_expenses/transactions_expenses_model.dart';
import 'package:shop_dio_api/data/repository/app_repository.dart';

class TransactionsExpensesViewModel extends ChangeNotifier {
  TransactionsExpensesViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  String errorForUI = "";

  bool isLoading = false;

  List<TransactionsExpenses>? incomeTypes;

  fetchAllTransactionsExpenses() async {
    MyResponse myResponse = await _appRepository.getAllTransactionsExpenses();

    if (myResponse.error.isEmpty) {
      incomeTypes = myResponse.data as List<TransactionsExpenses>;
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
