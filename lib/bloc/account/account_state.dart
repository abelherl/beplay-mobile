part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountWaiting extends AccountState {}

class AccountSuccess extends AccountState {
  final Map<String, dynamic> model;
  AccountSuccess({this.model});
}

class AccountFailed extends AccountState {
  final String message;
  AccountFailed({this.message});
}
