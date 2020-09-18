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
