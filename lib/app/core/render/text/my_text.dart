import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_widget_mixin.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class MyText extends StatelessWidget with BaseWidgetMixin {
  final String data;
  final TextStyle? style;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  MyText(
      {super.key,
      required this.data,
      this.style,
      this.height,
      this.width,
      this.textAlign});

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: height ?? ScreenAdapter.height(40),
      width: width ?? double.infinity,
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
