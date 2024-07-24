import 'package:flutter_component_library/app/core/values/app_values.dart';
import 'package:logger/logger.dart';



/**
 * 用于在 Flutter 应用中配置不同环境下的参数，并初始化日志记录器。
 * 通过使用构造方法设置必要的环境参数，并在初始化时配置 Logger 实例，用于在应用中打印和管理日志。
 */
class EnvConfig {
  final String appName;
  

  late final Logger logger;

  EnvConfig({
    required this.appName,
   
  }) {
    logger = Logger(
      /**
       * PrettyPrinter 是 Logger 库中的一个打印器，用于生成美观且易读的日志信息。
       */
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
/**
 * methodCount：显示的调用堆栈的方法数量。当打印日志时，会显示多少层级的方法调用堆栈。设置较大的值可以看到更多的方法调用链，便于调试；
 * errorMethodCount：如果提供了堆栈跟踪，显示的错误方法调用数量。当打印错误日志时，会显示多少层级的错误调用堆栈。与 methodCount 类似，但仅在打印错误时使用。
 * lineLength：定义日志输出的每行字符数长度。设置较大的值可以避免日志换行，便于阅读；
 * colors：是否启用彩色日志消息；
 * printEmojis：是否为每条日志消息打印一个表情符号；
 * printTime：是否在每条日志中打印时间戳；
 */