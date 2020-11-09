import 'dart:async';

import 'package:beplay/model/classes2.dart';
import 'package:beplay/model/invoic/invoice_parent.dart';
import 'package:beplay/model/reviews/data.dart';
import 'package:beplay/model/reviews/reviews_parent.dart';
import 'package:beplay/repositories/class_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'class_event.dart';
part 'class_state.dart';

ClassRepository repo = new ClassRepository();

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassInitial());

  @override
  Stream<ClassState> mapEventToState(
    ClassEvent event,
  ) async* {
    if (event is GetClass) {
      yield ClassWaiting();
      try {
        var response = await repo.getClasses();
        var list = response.data;
        print('CLASSES FOUND');

        print("INI RESPONSE $list");

        yield ClassSuccess(
          models: list,
        );
      } catch (e) {
        yield ClassFailed(message: e.toString());
      }
    }
    if (event is PostInvoice) {
      yield ClassWaiting();
      try {
        print('INVOICE IN MAKING');
        var response = await repo.postDataInvoice(event.model);

        print('INVOICE MADE');

        // print("INI RESPONSE $list");

        yield InvoiceSuccess();
      } catch (e) {
        yield InvoiceFailed();
      }
    }
    if (event is GetReviews) {
      yield ClassWaiting();
      try {
        print('GETTING');
        var response = await repo.getReviews(event.id);
        var list = response.data;
        print('REVIEWS FOUND');

        print("INI RESPONSE $list");

        yield ReviewsSuccess(models: list);
      } catch (e) {
        print('error $e');
        yield ClassFailed(message: e.toString());
      }
    }
    if (event is PostReviews) {
      yield ClassWaiting();
      try {
        print('Post Ready');
        var response = await repo.postReviews(event.id, event.model);
        if (response != null) {
          yield ReviewsPostSuccess(models: response);
        } else {
          yield ReviewsPostFailed();
        }
      } catch (e) {
        yield ReviewsPostFailed();
      }
    } else {}
  }
}
