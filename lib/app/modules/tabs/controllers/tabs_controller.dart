
import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/modules/home/views/home_view.dart';
import 'package:flutter_component_library/app/modules/knowledge/views/knowledge_view.dart';
import 'package:flutter_component_library/app/modules/tool/views/tool_view.dart';
import 'package:flutter_component_library/app/modules/user/views/user_view.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = Get.arguments != null
      ? PageController(initialPage: Get.arguments["initialPage"])
      : PageController(initialPage: 0);

final List<Widget> pages = [
    HomeView(),
    const KnowledgeView(),
    const ToolView(),
    const UserView()
  ];

  @override
  void onInit() {
    super.onInit();
        if (Get.arguments != null) {
      currentIndex.value=Get.arguments["initialPage"];
      update();
    }
  }


  @override
  void onClose() {
    super.onClose();
  }

 void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
