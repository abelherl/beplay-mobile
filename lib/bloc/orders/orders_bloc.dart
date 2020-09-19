import 'dart:async';
import 'package:beplay/model/orders_model.dart';
import 'package:beplay/repositories/orders_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'orders_event.dart';
part 'orders_state.dart';

InvoiceRepository orders = new InvoiceRepository();

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is GetOrders) {
      yield OrdersWaiting();
      try {
        var response = await orders.getOrdersOnGoingData();
        final list = OrdersModel.fromJson(response).data;
        if (response != null) {
          yield OrdersSuccess(model: list);
        } else {
          yield OrdersFailed(message: "Data Orders Not Found");
        }
      } catch (e) {
        yield OrdersFailed(message: e.toString());
      }
    } else if (event is GetHistoryOrders) {
      yield OrdersWaiting();
      try {
        var response = await orders.getHistoryOrders();
        final list = OrdersModel.fromJson(response).data;
        if (response != null) {
          yield OrdersSuccess(model: list);
        } else {
          yield OrdersFailed(message: "Data Orders Not Found");
        }
      } catch (e) {
        yield OrdersFailed(message: e.toString());
      }
    }
  }
}
