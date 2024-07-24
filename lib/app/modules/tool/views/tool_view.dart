import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tool_controller.dart';

class ToolView extends GetView<ToolController> {
  const ToolView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToolView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ToolView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
