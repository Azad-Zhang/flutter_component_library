import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_view.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';
import 'package:flutter_component_library/app/modules/home/widgets/home_item_card.dart';
import 'package:flutter_component_library/app/modules/home/widgets/tabs_app_bar.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({
    super.key,
  }) : super(parentPaddings: [
          ScreenAdapter.width(16),
          ScreenAdapter.height(0),
          ScreenAdapter.width(16),
          ScreenAdapter.height(0)
        ], bgColor: AppColors.homeBgColor);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return TabsAppBar(
      tabController: controller.tabController,
      tabs: controller.tabList,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              Center(
                  child: Column(
                children: [
                  HomeItemCard(
                      title: "Container",
                      descripe:
                          "用于容纳单个子组件的容器组件。集成了若干个单子组件的功能，如内外边距、形变、装饰、约束等等来来来；llllll",
                      type: 0,
                      state: 0,)
                ],
              )),
              Center(child: Text('热点内容')),
              Center(child: Text('娱乐内容')),
              Center(child: Text('体育内容')),
              Center(child: Text('推荐内容')),
              Center(child: Text('热点内容')),
              Center(child: Text('娱乐内容')),
            ],
          ),
        ),
      ],
    );
  }
}
