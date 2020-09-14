part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginWaiting extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel model;
  LoginSuccess({this.model});
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({this.message});
}
