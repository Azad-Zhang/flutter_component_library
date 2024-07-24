
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_component_library/app/routes/app_pages.dart';
import 'package:flutter_component_library/flavors/build_config.dart';
import 'package:flutter_component_library/flavors/env_config.dart';
import 'package:flutter_component_library/flavors/environment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 WidgetsFlutterBinding 已初始化
  EnvConfig devConfig = EnvConfig(
    appName: "aiCare",
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  //配置状态栏字体为黑色
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 设置状态栏透明
    statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为黑色
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
              // fontFamily: 'Inter', // 设置默认字体
              colorScheme: const ColorScheme.light(
                  onPrimary: Colors.white, surfaceTint: Colors.transparent)),
          debugShowCheckedModeBanner: false,
          title: _envConfig.appName,
          initialRoute: AppPages.INITIAL,
          // initialBinding: InitialBinding(),
          //配置ios动画
          defaultTransition: Transition.rightToLeft,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
