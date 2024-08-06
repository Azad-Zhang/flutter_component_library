import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/base_widget_mixin.dart';
import 'package:flutter_component_library/app/core/render/text/my_text.dart';

class HomeItemCard extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String descripe;
  final int type;
  final int state;
  HomeItemCard(
      {super.key,
      required this.title,
      required this.descripe,
      required this.type,
      required this.state});

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        MyText(
          data: title,
          style: TextStyle(),
        ),
      ],
    );
  }
}
