import 'package:flutter_component_library/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_component_library/app/modules/knowledge/controllers/knowledge_controller.dart';
import 'package:flutter_component_library/app/modules/tool/controllers/tool_controller.dart';
import 'package:flutter_component_library/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<KnowledgeController>(
      () => KnowledgeController(),
    );
    Get.lazyPut<ToolController>(
      () => ToolController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
