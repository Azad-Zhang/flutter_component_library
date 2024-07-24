import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red, //选中的颜色
            currentIndex: controller.currentIndex.value, //第几个菜单选中
            type: BottomNavigationBarType.fixed, //如果底部有4个或者4个以上的
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "组件"),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: "知识"),
              BottomNavigationBarItem(icon: Icon(Icons.build), label: "工具"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
            ],
          ),
        ));
  }
}
