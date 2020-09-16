part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterWaiting extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final Map<String, dynamic> model;
  RegisterSuccess({this.model});
}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed({this.message});
}
