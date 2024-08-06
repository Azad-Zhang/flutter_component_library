import 'package:flutter/material.dart';

class FlutterWaveLoading extends StatefulWidget {
  //宽高
  final double width;
  final double height;

  //波浪高度
  final double waveHeight;

  //波浪颜色
  final Color color;

  //波浪的边框宽度。
  final double strokeWidth;

  //波浪上升的进度。
  //作用: 控制波浪的垂直上升高度。值的范围通常在 0 到 1 之间，0 表示波浪完全在底部，1 表示波浪完全上升到容器的顶部。
  final double progress;

  //解释: 波浪移动的因子。
  //作用: 控制波浪动画的水平滚动速度。值通常在 0 到 1 之间，影响波浪的平移效果。较大的值会使波浪滚动得更快。
  final double factor;

  //解释: 波浪的透明度。
  //作用: 设置波浪的透明度。值通常在 0 到 255 之间，0 表示完全透明，255 表示完全不透明。影响波浪颜色的透明度。
  final int secondAlpha;

  //解释: 圆角半径。
  //作用: 控制容器的圆角弧度。如果容器的 borderRadius 设置较大，会使容器的角部更圆润。如果 isOval 为 true，这个属性没有效果，因为会绘制为椭圆。
  final double borderRadius;

  //解释: 是否使用椭圆形容器。
  //作用: 如果设置为 true，则容器的形状将为椭圆，而不是矩形的圆角矩形。如果为 false，则使用圆角矩形形状。这个属性用于决定绘制的形状。
  final bool isOval;

  FlutterWaveLoading(
      {this.width = 100,
      this.height = 100 / 0.618,
      this.factor = 1,
      this.waveHeight = 5,
      this.progress = 0.5,
      this.color = Colors.green,
      this.strokeWidth = 3,
      this.secondAlpha = 88,
      this.isOval = false,
      this.borderRadius = 20});

  @override
  _FlutterWaveLoadingState createState() => _FlutterWaveLoadingState();
}

class _FlutterWaveLoadingState extends State<FlutterWaveLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _anim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200))
          ..addListener(() {
            setState(() {});
          })
          ..repeat();
    _anim = CurveTween(curve: Curves.linear).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: widget.width,
        height: widget.height,
        child: CustomPaint(
          painter: BezierPainter(
              factor: _anim.value,
              waveHeight: widget.waveHeight,
              progress: widget.progress,
              color: widget.color,
              strokeWidth: widget.strokeWidth,
              secondAlpha: widget.secondAlpha,
              isOval: widget.isOval,
              borderRadius: widget.borderRadius),
        ),
      ),
    );
  }
}

//这个类继承自 CustomPainter，用于在 Canvas 上绘制波浪。
/**
 *•	_mainPaint: 用于绘制图形的 Paint 对象。
	•	_mainPath: 用于存储绘制路径的 Path 对象。
	•	waveWidth: 波浪的宽度，初始值为 80。
	•	wrapHeight: 包裹高度，将在 paint 方法中计算得到。
	•	waveHeight: 波浪的高度，设置为 final 表示不可变。
	•	color: 波浪的颜色。
	•	strokeWidth: 波浪的边框宽度。
	•	progress: 波浪的进度，用于控制波浪的垂直上升高度。
	•	factor: 控制波浪水平滚动速度的因子。
	•	secondAlpha: 波浪的透明度（在此代码中未使用）。
	•	borderRadius: 圆角半径，用于控制容器的圆角弧度。
	•	isOval: 布尔值，决定容器是否绘制为椭圆形。
 */
class BezierPainter extends CustomPainter {
  late Paint _mainPaint;
  late Path _mainPath;

  double waveWidth = 80;
  late double wrapHeight;

  final double waveHeight;
  final Color color;
  final double strokeWidth;
  final double progress;
  final double factor;
  final int secondAlpha;
  final double borderRadius;
  final bool isOval;

  BezierPainter(
      {this.factor = 1,
      this.waveHeight = 8,
      this.progress = 0.5,
      this.color = Colors.green,
      this.strokeWidth = 3,
      this.secondAlpha = 88,
      this.isOval = false,
      this.borderRadius = 20}) {
    _mainPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    _mainPath = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    waveWidth = size.width / 2;
    wrapHeight = size.height;

    Path path = Path();
    if (!isOval) {
      path.addRRect(
          RRect.fromRectXY(Offset(0, 0) & size, borderRadius, borderRadius));
      canvas.clipPath(path);
      canvas.drawPath(
          path,
          _mainPaint
            ..strokeWidth = strokeWidth
            ..color = color);
    }
    if (isOval) {
      path.addOval(Offset(0, 0) & size);
      canvas.clipPath(path);
      canvas.drawPath(
          path,
          _mainPaint
            ..strokeWidth = strokeWidth
            ..color = color);
    }
    canvas.translate(0, wrapHeight);
    canvas.save();
    canvas.translate(0, waveHeight);
    canvas.save();
    canvas.translate(-4 * waveWidth + 2 * waveWidth * factor, 0);
    drawWave(canvas);
    //第二条线
    // canvas.drawPath(
    //     _mainPath,
    //     _mainPaint
    //       ..style = PaintingStyle.fill
    //       ..color = color.withAlpha(88));
    canvas.restore();

    canvas.translate(-4 * waveWidth + 2 * waveWidth * factor * 2, 0);
    drawWave(canvas);
    canvas.drawPath(
        _mainPath,
        _mainPaint
          ..style = PaintingStyle.fill
          ..color = color);
    canvas.restore();
  }

  void drawWave(Canvas canvas) {
    _mainPath.moveTo(0, 0);
    _mainPath.relativeLineTo(0, -wrapHeight * progress);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, waveHeight * 2, waveWidth, 0);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, waveHeight * 2, waveWidth, 0);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    _mainPath.relativeQuadraticBezierTo(
        waveWidth / 2, waveHeight * 2, waveWidth, 0);
    _mainPath.relativeLineTo(0, wrapHeight);
    _mainPath.relativeLineTo(-waveWidth * 3 * 2.0, 0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
