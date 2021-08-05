class User {
  final int? id;
  final String name;
  final String email;
  final String username;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'], email: json['email'], username: json['username']);
  }
}
