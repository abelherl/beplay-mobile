import 'dart:async';
import 'package:beplay/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

UserRepository repo = new UserRepository();

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutInitial());

  @override
  Stream<LogOutState> mapEventToState(
    LogOutEvent event,
  ) async* {
    if (event is LogOut) {
      try {
        var response = await repo.logout();
        if (response != null) {
          yield LogOutSuccess(model: response);
        } else {
          yield LogOutFailed(message: "User Not Found");
        }
      } catch (e) {
        yield LogOutFailed(message: e.toString());
      }
    }
  }
}
