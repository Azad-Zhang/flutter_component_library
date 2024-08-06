import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_widget_mixin.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class WidgetHomeCard extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String describe;
  WidgetHomeCard({super.key, required this.title, required this.describe});

  @override
  Widget body(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(375),
      height: ScreenAdapter.height(54),
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(12),
          ScreenAdapter.height(8),
          ScreenAdapter.width(12),
          ScreenAdapter.height(8)),
      child: Column(
        children: [
          SizedBox(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.Color333),
            ),
          ),
          //
          SizedBox(
            child: Text(
              describe,
              style: TextStyle(),
              maxLines: 2, // 最多显示两行
              overflow: TextOverflow.ellipsis, // 超出部分显示省略号
            ),
          )
        ],
      ),
    );
  }
}
