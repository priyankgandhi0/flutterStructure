enum BuildEnvironment { development, production }

BuildEnv? get env => _env;
BuildEnv? _env;

class BuildEnv {
  final BuildEnvironment buildEnvironment;
  final String baseUrl;

  BuildEnv._(this.buildEnvironment, this.baseUrl);

  static void init(
      {required BuildEnvironment buildEnvironment, required String baseUrl}) {
    _env = _env ?? BuildEnv._(buildEnvironment, baseUrl);
  }
}
