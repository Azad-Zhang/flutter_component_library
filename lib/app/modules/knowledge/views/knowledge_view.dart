import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/knowledge_controller.dart';

class KnowledgeView extends GetView<KnowledgeController> {
  const KnowledgeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KnowledgeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KnowledgeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
