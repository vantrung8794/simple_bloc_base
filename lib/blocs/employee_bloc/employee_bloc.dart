import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:simple_bloc_base/datas/employee_remote.dart';

import '../../models/models.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc(this._employeeRemote) : super(const EmployeeState()) {
    on<GetEmployeesEvent>(_onGetEmployees);
  }

  final EmployeeRemote _employeeRemote;

  Future<void> _onGetEmployees(
      GetEmployeesEvent event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _employeeRemote.getEmployees();

    final newState = result.fold(
      (l) => state.copyWith(errMessage: l.message),
      (r) => state.copyWith(employees: r),
    );
    emit(newState);
  }
}
