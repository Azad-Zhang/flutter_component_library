import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_component_library/app/core/render/inset_box_shadow/lib/box_decoration.dart';
import 'package:flutter_component_library/app/core/render/inset_box_shadow/lib/box_shadow.dart';

import 'package:flutter_component_library/app/modules/knowledge/controllers/knowledge_controller.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';





class KnowledgeView extends GetView<KnowledgeController> {
  const KnowledgeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KnowledgeView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Text(
              'KnowledgeView is working',
              style: TextStyle(fontSize: 20),
            ),
                
            


            // Test(),
            // FlutterWaveLoading(
            //   width: ScreenAdapter.width(150), //宽
            //   height: ScreenAdapter.height(150), //高
            //   isOval: true, // 是否椭圆裁切
            //   progress: 0.8, // 进度
            //   waveHeight: ScreenAdapter.height(6), //波浪高
            //   color: Colors.green, //颜色
            // ),
            /**
             * data:数据（0-1）
             * width：总宽度
             * height：总高度
             * waveColor:波浪颜色
             * borderColor：边框颜色，默认为浅灰色
             * borderWidth：边框宽度，默认为2
             * borderMargin:边框与水滴球的间距，默认为4
             */
            // Liquid(
            //     //索引
            //     index: 0,
            //     //宽高和数据
            //     data: 0.55,
            //     width: ScreenAdapter.width(151),
            //     height: ScreenAdapter.height(151),
            //     //波浪
            //     waveColor: Colors.blue,
            //     // waveGradient: Colors.white,

            //     //背景
            //     bgColor: Colors.white,

            //     //边框
            //     // borderColor: Colors.red,
            //     borderGradient: LinearGradient(
            //       colors: [
            //         Color.fromRGBO(73, 242, 59, 1),
            //         Color.fromRGBO(133, 237, 0, 1)
            //       ], // 渐变色从红色到蓝色
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     borderWidth: ScreenAdapter.width(2),
            //     borderMargin: ScreenAdapter.width(12)),
          
          Container(
        width: 300,
        height: 300,
        child: Text("你好"),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color(0xffa1eaf0),
          //     Color(0XFFFF574F),
          //   ],
          // ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.45),
              offset: Offset(0,2),
              blurRadius: 100,
              spreadRadius: 0.0,
              inset: true,
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.45),
              offset: Offset(0, -2),
              blurRadius: 100,
              spreadRadius: 0.0,
              inset: true,
            ),
          ],
        )),
          
          ],
        ),
      ),
    );
  }
}
