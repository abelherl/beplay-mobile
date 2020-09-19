part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersWaiting extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final List<Data> model;
  OrdersSuccess({this.model});
}

class OrdersFailed extends OrdersState {
  final String message;
  OrdersFailed({this.message});
}
