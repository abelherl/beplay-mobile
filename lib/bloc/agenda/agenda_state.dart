part of 'agenda_bloc.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();

  @override
  List<Object> get props => [];
}

class AgendaInitial extends AgendaState {}

class AgendaWaiting extends AgendaState {}

class AgendaSuccess extends AgendaState {
  final List<Data> model;
  AgendaSuccess({this.model});
}

class AgendaFailed extends AgendaState {
  final String message;
  AgendaFailed({this.message});
}
