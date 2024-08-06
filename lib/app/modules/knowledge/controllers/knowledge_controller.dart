import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/core/render/inset_box_shadow/lib/box_shadow.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';
import 'package:get/get.dart';



class KnowledgeController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
