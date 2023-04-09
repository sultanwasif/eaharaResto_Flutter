class User {
  final String userName;
  final String password;

  const User({
    required this.userName,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['UserName'],
      password: json['Password'],
    );
  }
}