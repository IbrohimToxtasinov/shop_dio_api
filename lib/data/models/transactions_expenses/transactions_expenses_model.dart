import 'package:shop_dio_api/data/models/transactions_expenses/data_model.dart';

class TransactionsExpenses {
  TransactionsExpenses({
    required this.transferDate,
    required this.data,
  });

  final String transferDate;
  final List<Data> data;

  factory TransactionsExpenses.fromJson(Map<String, dynamic> json) {
    return TransactionsExpenses(
      transferDate: json["transfer_date"] as String? ?? "",
      data: List<Data>.from(
        json["data"].map(
              (x) => Data.fromJson(x),
            ) as List? ??
            [],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "transfer_date": transferDate,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}