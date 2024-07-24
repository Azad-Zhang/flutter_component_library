import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';

class TabsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabs;
  final double? customHeight; // 用于接收外界传入的高度

  const TabsAppBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.customHeight, // 新增参数
  });

  @override
  Size get preferredSize {
    if (customHeight != null) {
      return Size.fromHeight(customHeight!); // 如果传入了高度参数，则使用传入的高度
    } else {
      return AppBar().preferredSize; // 否则使用原始的 AppBar 的 preferredSize
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          // padding: EdgeInsets.all(0),
          indicatorColor: AppColors.colorPrimary,
          automaticIndicatorColorAdjustment:false,
          ),
    );
  }
}
