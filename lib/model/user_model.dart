class UserRegister {
  String nama;
  String email;
  String password;
  String passwordConfirmation;

  UserRegister(
      {this.nama, this.email, this.password, this.passwordConfirmation});
  UserRegister.fromJson(Map<String, dynamic> json) {
    nama = json["nama"];
    email = json["email"];
    password = json["password"];
    passwordConfirmation = json["password_confirmation"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["nama"] = this.nama;
    data["email"] = this.email;
    data["password"] = this.password;
    data["password_confirmation"] = this.passwordConfirmation;
    return data;
  }
}

class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});
  UserLogin.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}

// class UserModel {
//   bool success;
//   String message;
//   Data data;

//   UserModel({this.success, this.message, this.data});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   User user;
//   String token;
//   String expiresAt;

//   Data({this.user, this.token, this.expiresAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     token = json['token'];
//     expiresAt = json['expires_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     data['token'] = this.token;
//     data['expires_at'] = this.expiresAt;
//     return data;
//   }
// }

// class User {
//   int id;
//   String email;
//   Null emailVerifiedAt;
//   String username;
//   String nama;
//   Null nomorTelepon;
//   Null image;
//   String createdAt;
//   String updatedAt;
//   Null deletedAt;

//   User(
//       {this.id,
//       this.email,
//       this.emailVerifiedAt,
//       this.username,
//       this.nama,
//       this.nomorTelepon,
//       this.image,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     username = json['username'];
//     nama = json['nama'];
//     nomorTelepon = json['nomor_telepon'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['username'] = this.username;
//     data['nama'] = this.nama;
//     data['nomor_telepon'] = this.nomorTelepon;
//     data['image'] = this.image;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }
