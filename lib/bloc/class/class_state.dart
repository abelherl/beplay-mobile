part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object> get props => [];
}

class ClassInitial extends ClassState {}

class ClassWaiting extends ClassState {}

class ReviewsSuccess extends ClassState {
  final List<Data> models;
  ReviewsSuccess({this.models});
}
class ReviewsPostSuccess extends ClassState{

  final Map<String, dynamic> models;
  final int id;
  ReviewsPostSuccess({this.models,this.id});
}

class InvoiceSuccess extends ClassState {}

class InvoiceFailed extends ClassState {}

class ClassSuccess extends ClassState {
  final List<Classes2> models;
  final int id;
  ClassSuccess({this.models,this.id});
}
class ReviewsPostFailed extends ClassState{}

class ClassFailed extends ClassState {
  final String message;
  ClassFailed({this.message});
}
