// user_model.dart

class UserModel {
  final int id;
  final String username;
  final String password;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
  });

  // Метод для конвертации UserModel в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  // Фабричный метод для создания UserModel из Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}
