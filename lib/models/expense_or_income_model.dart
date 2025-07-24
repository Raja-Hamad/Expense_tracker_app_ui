class ExpenseOrIncomeModel {
  final String id;
  final String name;
  final String amount;
  final String date;
  final String isPaid;
  final String type; // 'expense' or 'income'

  ExpenseOrIncomeModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.isPaid,
    required this.type,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'date': date,
      'isPaid': isPaid,
      'type': type,
    };
  }

  // Create from Map
  factory ExpenseOrIncomeModel.fromMap(Map<String, dynamic> map) {
    return ExpenseOrIncomeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      amount: map['amount'] ?? "",
      date: map['date'],
      isPaid: map['isPaid'] ?? "",
      type: map['type'] ?? 'expense',
    );
  }

  @override
  String toString() {
    return 'ExpenseOrIncomeModel(id: $id, name: $name, amount: $amount, date: $date, isPaid: $isPaid, type: $type)';
  }
}
