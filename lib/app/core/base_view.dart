import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_component_library/app/core/base_controller.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';
import 'package:flutter_component_library/app/core/widget/loading.dart';


import 'package:get/get.dart';

import 'package:logger/logger.dart';


import '/app/core/model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();



  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    // behavior: HitTestBehavior.translucent,
    // child:
    return Stack(
      children: [
        // annotatedRegion(context),
        pageScaffold(context),
        Obx(() => controller.pageState == PageState.LOADING
            ? shadowBox()
            : Container()),
        Obx(() => controller.pageState == PageState.LOADING
            ? _showLoading()
            : Container()),

        Obx(() => controller.errorMessage.isNotEmpty
            ? showErrorSnackBar(controller.errorMessage)
            : Container()),
        Container(),
      ],
    );
    // )
  }

  /**
   * AnnotatedRegion 是 Flutter 提供的一个组件，
   * 用于在特定的 Widget 区域内覆盖和修改系统状态（例如状态栏）的样式。
   * 在这里，它用来设置状态栏的背景颜色和图标的亮度。
   */
  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏透明
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为黑色
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  //自定义标题栏样式
  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    //SafeArea 是 Flutter 提供的一个组件，用于确保其子组件在不受设备状态栏、底部导航栏和其他系统UI元素干扰的安全区域内显示。它会自动适应设备，并确保内容不会被遮挡。
    return SafeArea(

      child: body(context),
    );
    // return body(context);
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  // void showToast(String message) {
  //   Fluttertoast.showToast(
  //       msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  // }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return Colors.red;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }

  Widget shadowBox() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.3), // 半透明的阴影色
    );
  }
}
