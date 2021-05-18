class User {
  String name;
  String pass;
  User({this.name, this.pass});
  factory User.fromJson(Map<String, dynamic> user) =>
      User(name: user['name'], pass: user['pass']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "pass": pass,
      };
}

