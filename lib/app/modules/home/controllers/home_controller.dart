import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  late TabController tabController;
  List<String> tabList = ["无态", "有态", "单渲", "多渲", "滑片", "代理", "其他"];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
