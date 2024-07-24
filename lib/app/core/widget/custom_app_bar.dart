import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/widget/app_bar_title.dart';


import '/app/core/values/app_colors.dart';

//根据我们的应用程序设计定制的默认应用程序栏
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final double? customHeight; // 用于接收外界传入的高度

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.customHeight, // 新增参数
  }) : super(key: key);

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
      // backgroundColor: AppColors.appBarColor,
      // backgroundColor: Colors.black,
      
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: AppBarTitle(text: appBarTitleText),
      
    );
  }
}
