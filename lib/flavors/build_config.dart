import '/flavors/env_config.dart';
import '/flavors/environment.dart';

/**
 * 用于在 Flutter 项目中管理和锁定不同的环境配置。
 * 通过使用单例模式和工厂构造方法，确保配置只被实例化一次并且在整个应用程序中全局共享。
 */
class BuildConfig {
  late final Environment environment;
  late final EnvConfig config;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }
}
