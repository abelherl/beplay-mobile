part of 'logout_bloc.dart';

abstract class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

class LogOutInitial extends LogOutState {}

class LogOutWaiting extends LogOutState {}

class LogOutSuccess extends LogOutState {
  final Map<String, dynamic> model;
  LogOutSuccess({this.model});
}

class LogOutFailed extends LogOutState {
  final String message;
  LogOutFailed({this.message});
}
