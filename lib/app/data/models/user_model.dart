class User {
  final int id;
  final String username;
  final String role;
  final String? referralCodeUsed;
  final String? reseller;
  late String? access_token;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.referralCodeUsed,
    required this.reseller,
    this.access_token,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'role': role,
        'referralCodeUsed': referralCodeUsed,
        'reseller': reseller,
        'access_token': access_token,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        role: json['role'],
        referralCodeUsed: json['referralCodeUsed'],
        reseller: json['reseller'],
        access_token: json['access_token'],
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
