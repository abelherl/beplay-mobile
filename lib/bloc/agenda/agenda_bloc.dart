import 'dart:async';
import 'package:beplay/model/agenda_model.dart';
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
        final listAgenda = AgendaModel.fromJson(response).data;
        if (listAgenda != null) {
          yield AgendaSuccess(model: listAgenda);
        } else {
          yield AgendaFailed(message: "Data Agenda Not Found");
        }
      } catch (e) {
        yield AgendaFailed(message: e.toString());
      }
    }
  }
}
