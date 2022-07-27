enum Env { dev, stg, prod }

extension EnvExtension on Env {
  String get value => ['dev', 'stg', 'prod'][index];
}
