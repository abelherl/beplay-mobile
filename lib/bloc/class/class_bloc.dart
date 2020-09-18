import 'dart:async';

import 'package:beplay/model/classes.dart';
import 'package:beplay/model/classes_parent.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/repositories/class_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
        print('CLASSES FOUND');
        print("INI RESPONSE $response");

        final list = ClassesParent.fromJsonMap(response).data;

        yield ClassSuccess(models: list);
      } catch (e) {
        yield ClassFailed(message: e.toString());
      }
    } else {}
  }
}
