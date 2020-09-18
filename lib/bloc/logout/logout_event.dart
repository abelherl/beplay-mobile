part of 'logout_bloc.dart';

abstract class LogOutEvent extends Equatable {
  const LogOutEvent();

  @override
  List<Object> get props => [];
}

class LogOut extends LogOutEvent {}
