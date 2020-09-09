import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum LoginEvent { response }

class LoginBloc extends Bloc<LoginEvent, String> {
  String _email, _password, _response;
  LoginBloc(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(LoginEvent event) async* {
    if (_email != null && _password != null) {
      _response = '123';
      yield _response;
    } else {
      _response = null;
    }
  }
}
