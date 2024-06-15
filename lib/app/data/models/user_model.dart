class User {
  final int Id;
  final String username;
  final String role;
  final String? referralCodeUsed;
  final String? reseller;
  late String? access_token;
  User(
      {required this.Id,
      required this.username,
      required this.role,
      required this.referralCodeUsed,
      required this.reseller,
      this.access_token});

  Map<String, dynamic> toJson() => {
        'Id': Id,
        'username': username,
        'role': role,
        'referralCodeUsed': referralCodeUsed,
        'reseller': reseller,
        'access_token': access_token
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
      Id: json['id'],
      username: json['username'],
      role: json['role'],
      referralCodeUsed: json['referralCodeUsed'],
      reseller: json['reseller'],
      access_token: json['access_token']);

  void setToken(String token) {
    this.access_token = token;
  }
}
