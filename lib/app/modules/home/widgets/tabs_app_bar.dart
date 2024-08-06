import 'package:flutter/material.dart' hide UnderlineTabIndicator;
import 'package:flutter_component_library/app/core/render/tabs/custom_tab_indicator.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

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
        //指示器
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
          width: ScreenAdapter.width(3.5),
          color: AppColors.colorPrimary,
        )),
        indicatorSize: TabBarIndicatorSize.label,
        //选中文本
        labelColor: AppColors.colorPrimary,
        labelStyle: TextStyle(
            fontSize: ScreenAdapter.fontSize(14), fontWeight: FontWeight.bold),
        labelPadding: EdgeInsets.only(
            left: ScreenAdapter.width(16), right: ScreenAdapter.width(16)),
        //未选中文本
        unselectedLabelColor: AppColors.Color999,
        unselectedLabelStyle: TextStyle(
            fontSize: ScreenAdapter.fontSize(14), fontWeight: FontWeight.bold),
        //数据
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        //控制器
        controller: tabController,
        //滚动
        isScrollable: true,
        //下划线
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        //起始位置
        tabAlignment: TabAlignment.start,
        //点击效果
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
