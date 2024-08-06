import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class Liquid extends StatelessWidget {
  final double width;
  final double height;
  final int index;
  final double? data;
  final Color? bgColor;
  final double? borderWidth; // 边框宽度

  // //边框颜色与边框渐变色两者只能传入一个
  // final Color? borderColor; // 边框颜色
  final LinearGradient borderGradient; //边框渐变色

  final Color? waveColor; //波浪颜色
  final double? borderMargin; // 边框与圆的边距

  //配置列表
  List<Map<String, dynamic>> settingList = [
    {
      "borderColor": {
        'type': 'linear',
        'x': 0,
        'y': 0,
        'x2': 0,
        'y2': 1,
        'colorStops': [
          {
            'offset': 0,
            'color': '#49F23B' // 渐变起始颜色
          },
          {
            'offset': 1,
            'color': '#85ED00' // 渐变结束颜色
          }
        ]
      }
    },
    {
      "borderColor": {
        'type': 'linear',
        'x': 0,
        'y': 0,
        'x2': 0,
        'y2': 1,
        'colorStops': [
          {
            'offset': 0,
            'color': '#FFDA92' // 渐变起始颜色
          },
          {
            'offset': 1,
            'color': '#E69244' // 渐变结束颜色
          }
        ]
      }
    },
    {
      "borderColor": {
        'type': 'linear',
        'x': 0,
        'y': 0,
        'x2': 0,
        'y2': 1,
        'colorStops': [
          {
            'offset': 0,
            'color': '#C293FF' // 渐变起始颜色
          },
          {
            'offset': 1,
            'color': '#E7D4FF' // 渐变结束颜色
          }
        ]
      }
    },
    {
      "borderColor": {
        'type': 'linear',
        'x': 0,
        'y': 0,
        'x2': 0,
        'y2': 1,
        'colorStops': [
          {
            'offset': 0,
            'color': '#FF7D79' // 渐变起始颜色
          },
          {
            'offset': 1,
            'color': '#FF0D03' // 渐变结束颜色
          }
        ]
      }
    },
  ];

  // List textList = ["#49F23B", "#FFDA92", "#C293FF", "#FF7D79"];
    // 直接用 Color 对象定义颜色列表
  final List<Color> textList = [
    Color(0xFF49F23B), // #49F23B
    Color(0xFFFFDA92), // #FFDA92
    Color(0xFFC293FF), // #C293FF
    Color(0xFFFF7D79), // #FF7D79
  ];

  List bgList = [
    "assets/images/green_circle.png",
    // "assets/images/orange_circle.svg",
    // "assets/images/purple_circle.svg",
    // "assets/images/red_circle.svg"
  ];

  Liquid({
    super.key,
    required this.width,
    required this.height,
    this.data,
    this.bgColor,
    this.borderWidth,
    // this.borderColor,
    required this.borderGradient,
    this.borderMargin,
    this.waveColor,
    required this.index,
  });
  // : assert(borderColor == null || borderGradient == null,
  //           'borderColor and gradient cannot be both provided.')

  @override
  Widget build(BuildContext context) {
    String percentage = "${((data ?? 0.8) * 100).toInt()}%";
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, // 内部背景透明
        ),
        child: CustomPaint(
          painter: GradientBorderPainter(
            borderWidth: 2,
            gradient: borderGradient, // 边框渐变色
          ),
          child: Center(
            child: Container(
              width: (width -
                  (borderWidth ?? ScreenAdapter.width(2)) -
                  (borderMargin ?? ScreenAdapter.width(4))),
              height: (height -
                  (borderWidth ?? ScreenAdapter.width(2)) -
                  (borderMargin ?? ScreenAdapter.width(4))),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor ?? Colors.white,
              ),
              child: Center(
                child: Text(
                  percentage,
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(36),
                      fontWeight: FontWeight.w500,
                      height: ScreenAdapter.fontSize(42 / 36),
                      color: textList[index] // 设置文本颜色
                      ),
                ),
              ),
            ),
          
          ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double borderWidth;
  final LinearGradient gradient;

  GradientBorderPainter({
    required this.borderWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawCircle(
      size.center(Offset.zero),
      (size.width - borderWidth) / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
