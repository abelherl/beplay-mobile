import 'dart:async';
import 'package:beplay/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'account_event.dart';
part 'account_state.dart';

UserRepository repo = new UserRepository();

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is UpdateUserData) {
      yield AccountWaiting();
      try {
        var response = await repo.updateUserData(event.data);
        if (response != null) {
          yield AccountSuccess(model: response);
        } else {
          yield AccountFailed(message: "Update Data Failed");
        }
      } catch (e) {
        yield AccountFailed(message: e.toString());
      }
    } else if (event is UpdateUserPassword) {
      yield AccountWaiting();
      try {
        var response = await repo.updateUserPassword(event.data);
        if (response != null) {
          yield AccountSuccess(model: response);
        } else {
          yield AccountFailed(message: "Update Password Failed");
        }
      } catch (e) {
        yield AccountFailed(message: e.toString());
      }
    }
  }
}
