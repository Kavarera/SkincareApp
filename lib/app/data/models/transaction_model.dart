class Transaction {
  final int id;
  final int customerId;
  final int productId;
  final int amount;
  final DateTime date;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.amount,
    required this.date,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      customerId: json['customerId'],
      productId: json['productId'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "customerId": customerId,
      "productId": productId,
      "amount": amount,
      "date": date.toIso8601String(),
      "status": status,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
