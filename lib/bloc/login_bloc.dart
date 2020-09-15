import 'dart:async';

import 'package:beplay/model/user_model.dart';
import 'package:beplay/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

UserRepository repo = new UserRepository();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    print(event);
    if (event is Login) {
      print(event.model.email);
      yield LoginWaiting();
      try {
        UserModel models = await repo.login(event.model);
        yield LoginSuccess(model: models);
      } catch (e) {
        yield LoginFailed(message: e.toString());
      }
    } else {}
  }
}
