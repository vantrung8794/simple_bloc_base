import 'package:flutter_core/flutter_core.dart';
import 'package:global_configs/global_configs.dart';

import 'constants/constants.dart';
import 'dependences/dependencies.dart' as di;

class AppConfig {
  AppConfig._();

  static AppConfig get instance => AppConfig._();

  Future<void> configApp({required Env env}) async {
    await _configEnv(env: env);
    await _configDi();
    _configUI();
  }

  void _configUI() {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  Future _configEnv({required Env env}) async {
    await EnvConfig.instance.load(envStr: env.value);
  }

  Future _configDi() async {
    await di.init();
  }
}

class EnvConfig {
  EnvConfig._();

  static EnvConfig get instance => EnvConfig._();

  Future<void> load({required String envStr}) async {
    await GlobalConfigs().loadJsonFromdir('assets/cfg/env_$envStr.json');
  }

  String get apiUrl => GlobalConfigs().get('api_url');
}
