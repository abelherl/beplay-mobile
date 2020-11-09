part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object> get props => [];
}

class GetClass extends ClassEvent {}
class PostReviews extends ClassEvent{
  final Data model;
  final int id;
  PostReviews({this.model,this.id});
}

class GetReviews extends ClassEvent {
  GetReviews({this.id});
  final int id;
}

class PostInvoice extends ClassEvent {
  PostInvoice({this.model,this.id,this.nominal});
  final Data_Invoice model;
  final int id;
  final int nominal;
}
