class User {
  final int id;
  final String username;
  final String role;
  final String? referralCodeUsed;
  final String? reseller;
  late String? access_token;
  User(
      {required this.id,
      required this.username,
      required this.role,
      required this.referralCodeUsed,
      required this.reseller,
      this.access_token});

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'role': role,
        'referralCodeUsed': referralCodeUsed,
        'reseller': reseller,
        'access_token': access_token
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      role: json['role'],
      referralCodeUsed: json['referralCodeUsed'],
      reseller: json['reseller'],
      access_token: json['access_token']);

  void setToken(String token) {
    this.access_token = token;
  }
}
