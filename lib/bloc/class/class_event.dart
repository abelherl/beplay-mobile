part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object> get props => [];
}

class GetClass extends ClassEvent {}

class GetReviews extends ClassEvent {
  GetReviews({this.id});
  final int id;
}

class PostInvoice extends ClassEvent {
  PostInvoice({this.id, this.nominal});
  final int id;
  final int nominal;
}
