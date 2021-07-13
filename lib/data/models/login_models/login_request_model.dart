class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> jsonRequest) {
    email = jsonRequest['email'];
    password = jsonRequest['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['Password'] = this.password;

    return data;
  }
}
