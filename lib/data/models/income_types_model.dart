class IncomeTypes {
  IncomeTypes({
    required this.id,
    required this.incomeType,
    required this.icon,
    required this.color,
  });

  final int id;
  final String incomeType;
  final String icon;
  final String color;

  factory IncomeTypes.fromJson(Map<String, dynamic> json) {
    return IncomeTypes(
      id: json["id"] as int? ?? 0,
      incomeType: json["income_type"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
      color: json["color"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "income_type": incomeType,
        "icon": icon,
        "color": color,
      };
}
