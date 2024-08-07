import 'account_model.dart';

class User {
  final int id;
  final String username;
  final String role;
  final String? referralCodeUsed;
  final String? bankName;
  final String? rekening;
  Reseller? reseller;
  late String? access_token;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.referralCodeUsed,
    this.reseller,
    required this.bankName,
    required this.rekening,
    this.access_token,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'role': role,
        'referralCodeUsed': referralCodeUsed,
        'reseller': reseller?.toJson(),
        'bankName': bankName,
        'noRekening': rekening,
        'access_token': access_token,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        role: json['role'],
        referralCodeUsed: json['referralCodeUsed'],
        bankName: json['bankName'],
        rekening: json['noRekening'],
        access_token: json['access_token'],
        reseller: json['reseller'] != null
            ? Reseller.fromJson(json['reseller'])
            : null,
      );

  void setToken(String token) {
    this.access_token = token;
  }
}

class UserResponse {
  User user;
  String accessToken;

  UserResponse({required this.user, required this.accessToken});

  UserResponse.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        accessToken = json['access_token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['access_token'] = accessToken;
    return data;
  }
}

class UserData {
  int id;
  String username;
  String password;
  String role;
  String? referralCodeUsed;
  String createdAt;
  String updatedAt;
  String? reseller;

  UserData({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
    this.referralCodeUsed,
    required this.createdAt,
    required this.updatedAt,
    this.reseller,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        role: json['role'],
        referralCodeUsed: json['referralCodeUsed'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        reseller: json['reseller'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['role'] = role;
    data['referralCodeUsed'] = referralCodeUsed;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['reseller'] = reseller;
    return data;
  }
}
