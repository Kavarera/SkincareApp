class Account {
  int id;
  String username;
  String password;
  String role;
  String? referralCodeUsed;
  String? bankName;
  String? noRekening;
  Reseller? reseller;

  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
    this.referralCodeUsed,
    this.bankName,
    this.noRekening,
    this.reseller,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      referralCodeUsed: json['referralCodeUsed'],
      bankName: json['bankName'],
      noRekening: json['noRekening'],
      reseller:
          json['reseller'] != null ? Reseller.fromJson(json['reseller']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['role'] = role;
    data['referralCodeUsed'] = referralCodeUsed;
    data['bankName'] = bankName;
    data['noRekening'] = noRekening;
    data['reseller'] = reseller?.toJson();
    return data;
  }
}

class Reseller {
  int id;
  int userId;
  String? code;
  String balance;
  String createdAt;
  String updatedAt;

  Reseller({
    required this.id,
    required this.userId,
    this.code,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reseller.fromJson(Map<String, dynamic> json) => Reseller(
        id: json['id'],
        userId: json['userId'],
        code: json['code'],
        balance: json['balance'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['code'] = this.code;
    data['balance'] = this.balance;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
