
class UserModel {
  // ignore: non_constant_identifier_names
  String full_name;
  String email;
  String phone;
  String password;
  String gender;
  String talents;

  UserModel({
    // ignore: non_constant_identifier_names
    required this.full_name,
    required this.email,
    required this.phone,
    required this.password,
    required this.gender,
    required this.talents,
  });

  Map<String, dynamic> toMap() {
    return {
      'full_name': full_name,
      'email': email,
      'phone': phone,
      'password': password,
      'gender': gender,
      'talents': talents,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      full_name: map['full_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      gender: map['gender'] ?? '',
      talents: map['talents'] ?? '',
    );
  }
}
