class User {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? confirmPassword;

  User({required this.name, required this.email, required this.phone, required this.password, required this.confirmPassword,});
  User.from({required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        confirmPassword = json['confirmPassword'];

  Map<String, dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'phone' : phone,
    'password' : password,
    'confirmPassword' : confirmPassword,
  };
}