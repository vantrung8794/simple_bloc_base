import 'package:flutter_core/flutter_core.dart';
import 'bloc_dependencies.dart' as bloc;
import 'data_remote_dependencies.dart' as datasource;
import 'external_dependencies.dart' as externa;
import 'page_dependencies.dart' as page;

Future<void> init() async {
  final injector = GetIt.instance;
  await externa.config(injector);
  await datasource.config(injector);
  await bloc.config(injector);
  await page.config(injector);
}
