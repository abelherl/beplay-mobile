import 'dart:async';
import 'package:beplay/repositories/agenda_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

AgendaRepository agenda = new AgendaRepository();

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(AgendaInitial());

  @override
  Stream<AgendaState> mapEventToState(
    AgendaEvent event,
  ) async* {
    if (event is GetAgenda) {
      yield AgendaWaiting();
      try {
        var response = await agenda.getAgendaData();
        if (response != null) {
          yield AgendaSuccess(data: response);
        } else {
          yield AgendaFailed(message: "Data Agenda Not Found");
        }
      } catch (e) {
        yield AgendaFailed(message: e.toString());
      }
    }
  }
}
