import 'package:beplay/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Dio dio = new Dio();
  Response response;
  String urlLogin = "https://damp-basin-32676.herokuapp.com/api/auth/login";
  String urlSignUp = "https://damp-basin-32676.herokuapp.com/api/auth/login";

  // ignore: missing_return
  Future<UserModel> login(UserModel model) async {
    FormData data = FormData.fromMap({
      'email': model.email,
      'password': model.password,
    });
    response = await dio.post(urlLogin, data: data);
    UserModel models = UserModel.fromJson(response.data);
    return models;
  }

  Future<UserModel> signUp(UserModel model) async {
    FormData data = FormData.fromMap({
      'nama': model.nama,
      'email': model.email,
      'password': model.password,
      'password_confirmation': model.passwordConfirmation,
    });
    response = await dio.post(urlSignUp, data: data);
    UserModel models = UserModel.fromJson(response.data);
    return models;
  }
}
