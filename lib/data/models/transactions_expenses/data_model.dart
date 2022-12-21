import 'package:shop_dio_api/data/models/transactions_expenses/receiver_model.dart';

class Data {
  Data({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiver,
  });

  final int transactionCode;
  final String date;
  final int expenseId;
  final num amount;
  final int cardId;
  final Receiver receiver;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionCode: json["transaction_code"] as int? ?? 0,
        date: json["date"] as String? ?? "",
        expenseId: json["expense_id"] as int? ?? 0,
        amount: json["amount"] as num? ?? 0.0,
        cardId: json["card_id"] as int? ?? 0,
        receiver: Receiver.fromJson(json["receiver"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_code": transactionCode,
        "date": date,
        "expense_id": expenseId,
        "amount": amount,
        "card_id": cardId,
        "receiver": receiver.toJson(),
      };
}
