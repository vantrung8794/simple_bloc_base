import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';

import '../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold<EmployeeBloc>(
      loadData: (bloc) => bloc?.add(GetEmployeesEvent()),
      title: const Text('Employee List'),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: _employeeListener,
      builder: (context, state) {
        final employees = state.employees;
        return ListView.builder(
          itemCount: employees?.length ?? 0,
          itemBuilder: (context, index) {
            final item = employees?[index];
            return EmployeeItem(item: item);
          },
        );
      },
    );
  }

  void _employeeListener(context, state) {
    if (state.isLoading) {
      UIHelper.showLoading();
    } else {
      UIHelper.hideLoading();
    }
    if (state.errMessage != null) {
      UIHelper.showSnackBar(context, msg: state.errMessage);
    }
  }
}
