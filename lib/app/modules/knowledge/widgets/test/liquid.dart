// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_component_library/app/core/base_widget_mixin.dart';
// import 'package:flutter_component_library/app/services/screenAdapter.dart';

// class Liquid extends StatelessWidget with BaseWidgetMixin {
//   final double width;
//   final double height;
//   final double? data;
//   final Color? bgColor;
//   final double? borderWidth; // 边框宽度

//   // //边框颜色与边框渐变色两者只能传入一个
//   // final Color? borderColor; // 边框颜色
//   final LinearGradient? borderGradient; //边框渐变色

//   final Color? waveColor; //波浪颜色
//   final double? borderMargin; // 边框与圆的边距

//   Liquid({
//     super.key,
//     required this.width,
//     required this.height,
//     this.data,
//     this.bgColor,
//     this.borderWidth,
//     // this.borderColor,
//     this.borderGradient,
//     this.borderMargin,
//     this.waveColor,
//   });
//   // : assert(borderColor == null || borderGradient == null,
//   //           'borderColor and gradient cannot be both provided.')

//   @override
//   Widget body(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: borderColor, // 边框颜色
//         gradient: borderGradient, // 边框渐变色
//         shape: BoxShape.circle, // 外层容器圆形
//       ),
//       child: Center(
//         child: Container(
//           width: (width - (borderWidth ?? ScreenAdapter.width(2))),
//           height: (height - (borderWidth ?? ScreenAdapter.width(2))),
//           decoration: BoxDecoration(
//             color: Colors.transparent, // 外层圆形背景颜色
//             shape: BoxShape.circle, // 外层容器圆形
//           ),
//           child: Center(
//             child: Container(
//               width: (width -
//                   (borderWidth ?? ScreenAdapter.width(2)) -
//                   (borderMargin ?? ScreenAdapter.width(4))),
//               height: (height -
//                   (borderWidth ?? ScreenAdapter.width(2)) -
//                   (borderMargin ?? ScreenAdapter.width(4))),
//               decoration: BoxDecoration(
//                 color: Colors.white, // 设置圆形背景颜色
//                 shape: BoxShape.circle, // 内层容器圆形
//               ),
//               child: Center(
//                 child: Text(
//                   "${data ?? 0.5}",
//                   style: TextStyle(
//                     color: Colors.black, // 文本颜色
//                     fontSize: 24, // 文本大小
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
