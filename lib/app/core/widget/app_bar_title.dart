import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/values/app_colors.dart';


import '/app/core/values/text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: AppColors.appBarTextColor),
      textAlign: TextAlign.center,
    );
  }
}


