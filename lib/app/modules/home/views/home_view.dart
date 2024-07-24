import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_view.dart';
import 'package:flutter_component_library/app/modules/home/widgets/tabs_app_bar.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return TabsAppBar(
      tabController: controller.tabController,
      tabs: ['推荐', '热点', '娱乐', '体育'],
    );
    ;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: [
              Center(child: Text('推荐内容')),
              Center(child: Text('热点内容')),
              Center(child: Text('娱乐内容')),
              Center(child: Text('体育内容')),
              // 对应更多的Tab内容
            ],
          ),
        ),
      ],
    );
  }
}
