
class JsonUser {
  String name;
  String email;
  String password;

  JsonUser({
    this.name,this.email,this.password

  });

  factory JsonUser.fromJson(Map<String, dynamic> parsedJson) {
    Map json = parsedJson['user'];
    return JsonUser(
        name: json['name'],
        email: json['email'],
        password: json['password']
    );
  }
}