part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object> get props => [];
}

class ClassInitial extends ClassState {}

class ClassWaiting extends ClassState {}

class ClassSuccess extends ClassState {
  final List<Classes> models;
  ClassSuccess({this.models});
}

class ClassFailed extends ClassState {
  final String message;
  ClassFailed({this.message});
}
