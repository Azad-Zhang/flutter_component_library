import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  late TabController tabController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
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
