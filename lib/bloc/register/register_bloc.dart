import 'dart:async';

import 'package:beplay/model/user_model.dart';
import 'package:beplay/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'register_event.dart';
part 'register_state.dart';

UserRepository repo = new UserRepository();

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is Register) {
      yield RegisterWaiting();
      try {
        UserModel models = await repo.signUp(event.model);
        yield RegisterSuccess(model: models);
      } catch (e) {
        yield RegisterFailed(message: e.toString());
      }
    } else {
      print("GAGAL");
    }
  }
}
