import 'package:flutter_core/flutter_core.dart';
import 'package:simple_bloc_base/models/models.dart';
import '../constants/constants.dart';

class EmployeeRemote {
  final AppClient _appClient;

  EmployeeRemote(this._appClient);

  Future<Either<Failure, List<Employee>?>> getEmployees() async {
    final result = await _appClient.call(ApiConstants.getEmployees,
        method: RestfulMethod.get);

    return result.fold(
      (l) => Left(l),
      (r) {
        if (r is List) {
          return Right(r.map((e) => Employee.fromJson(e)).toList());
        }
        return const Right(null);
      },
    );
  }
}
