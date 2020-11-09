part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class GetOrders extends OrdersEvent {}

class GetHistoryOrders extends OrdersEvent {}
class PostOrdersInvoice extends OrdersEvent{
  final Data_Invoice model;
  PostOrdersInvoice({this.model});

}
