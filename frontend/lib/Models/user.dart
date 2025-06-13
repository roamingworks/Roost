
class User {
  String username;
  String password;

  User({required this.username, required this.password});

  Map<String,String> toJson() {
    return {
      'username' : username,
      'password' : password,
    };
  }

  factory User.fromJson(Map<String,String> json) {
    return User(
      username: json['username']!,
      password: json['password']!,
    );
  }
}