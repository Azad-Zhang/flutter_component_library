import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TestI10nButton extends StatelessWidget {
  const TestI10nButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton(
            child: const Text("切换英文"),
            onPressed: () {
              Get.updateLocale(Locale('en', ''));
            },
          ),
        ),
        Center(
          child: TextButton(
            child: Text("切换中文"),
            onPressed: () {
              Get.updateLocale(Locale('zh', ''));
            },
          ),
        )
      ],
    );
  }
}
