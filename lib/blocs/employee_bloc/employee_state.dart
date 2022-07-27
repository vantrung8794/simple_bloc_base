part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  final List<Employee>? employees;
  final bool isLoading;
  final String? errMessage;

  const EmployeeState({
    this.employees,
    this.isLoading = false,
    this.errMessage,
  });

  @override
  List<Object?> get props => [isLoading, employees, errMessage];

  EmployeeState copyWith({
    List<Employee>? employees,
    bool isLoading = false,
    String? errMessage,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      isLoading: isLoading,
      errMessage: errMessage,
    );
  }
}
