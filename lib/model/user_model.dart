class UserModel {
  String email;
  String nama;
  String password;
  String passwordConfirmation;

  UserModel({this.nama, this.email, this.password, this.passwordConfirmation});
  UserModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["nama"] = this.nama;
    data["password"] = this.password;
    data["password_confirmation"] = this.passwordConfirmation;

    return data;
  }
}

// Dio dio = new Dio();
// Response response;
// String url = "https://damp-basin-32676.herokuapp.com/api/auth/register";

// Future<UserModel> registration(UserModel model) async {
//   FormData data = FormData.fromMap({
//     'nama': model.nama,
//     'email': model.email,
//     'password': model.password,
//     'password_confirmation': model.passwordConfirmation
//   });
//   response = await dio.post(url, data: model);
//   UserModel models = response.data;
//   return models;
// }
class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});
  UserLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
