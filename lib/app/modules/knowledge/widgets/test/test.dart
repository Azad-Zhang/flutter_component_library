import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    var percentage = "55%";
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          percentage,
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(36),
              fontWeight: FontWeight.w500,
              height: ScreenAdapter.fontSize(42 / 36),
              color: Colors.black // 设置文本颜色
              ),
        ),
      ),
    );
  }
}
