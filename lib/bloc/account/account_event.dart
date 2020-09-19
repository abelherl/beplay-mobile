part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserData extends AccountEvent {
  final Map<String, dynamic> data;
  UpdateUserData({@required this.data});
}

class UpdateUserPassword extends AccountEvent {
  final Map<String, dynamic> data;
  UpdateUserPassword({@required this.data});
}
