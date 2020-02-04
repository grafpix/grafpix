import 'package:flutter/material.dart';

class PixButton extends StatelessWidget {
  final Key key;
  final double radius;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double iconOpacity;
  final Function onPress;
  final Color backgroundColor;
  final double backgroundOpacity;
  final double shutter;
  final bool twinkles;
  const PixButton({
    this.key,
    this.radius = 40.0,
    @required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 30.0,
    this.iconOpacity = 0.8,
    this.onPress,
    this.backgroundColor,
    this.backgroundOpacity = 0.8,
    this.shutter = 0.8,
    this.twinkles = false,
  })  : assert(icon != null),
        assert(shutter >= 0.0 && shutter <= 1.0),
        assert(iconOpacity >= 0.0 && iconOpacity <= 1.0),
        assert(backgroundOpacity >= 0.0 && backgroundOpacity <= 1.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) onPress();
      },
      child: CustomPaint(
        painter: GlassShell(
          shutter: shutter,
          backgroundColor: backgroundColor,
          backgroundOpacity: backgroundOpacity,
          twinkles: twinkles,
        ),
        child: Container(
          width: radius * 2,
          height: radius * 2,
          child: Icon(icon,
              color: iconColor.withOpacity(iconOpacity),
              size: (iconSize <= radius) ? iconSize : radius),
        ),
      ),
    );
  }
}

class GlassShell extends CustomPainter {
  final double shutter;
  final Color backgroundColor;
  final double backgroundOpacity;
  final bool twinkles;
  const GlassShell({
    this.shutter,
    this.backgroundColor,
    this.backgroundOpacity,
    this.twinkles,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const double reflectionIntense = 0.18;
    final double w = size.width;
    final double r = w / 2;
    final Rect oval = Rect.fromCircle(center: Offset(r, r), radius: r);
    final Rect twinkle1 =
        Rect.fromCircle(center: Offset(0.83 * w, 0.158 * w), radius: 0.055 * w);
    final Rect twinkle2 = Rect.fromCircle(
        center: Offset(0.0476 * w, 0.476 * w), radius: 0.0635 * w);
    final Rect twinkle3 = Rect.fromCircle(
        center: Offset(0.158 * w, 0.754 * w), radius: 0.0396 * w);
    final Paint ref1 = Paint()
      ..color = Colors.white.withOpacity(reflectionIntense);
    final Paint ref2 = Paint()
      ..color = Colors.white.withOpacity(reflectionIntense / 2);
    final Paint ref3 = Paint()
      ..shader = RadialGradient(
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.0),
          ],
          center: Alignment.center,
          stops: [0.15, 0.7]).createShader(twinkle1);
    final Paint ref4 = Paint()
      ..shader = RadialGradient(
          colors: [
            Colors.white.withOpacity(0.7),
            Colors.white.withOpacity(0.0),
          ],
          center: Alignment.center,
          stops: [0.1, 0.8]).createShader(twinkle2);
    final Paint ref5 = Paint()
      ..shader = RadialGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.white.withOpacity(0.0),
          ],
          center: Alignment.center,
          stops: [0.1, 0.8]).createShader(twinkle3);

    final Paint p1 = Paint()
      ..strokeWidth = 0.0258 * w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(colors: [
        Colors.black.withOpacity(0.25),
        Colors.black.withOpacity(0.05)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          .createShader(oval);

    final Paint p2 = Paint()
      ..strokeWidth = 0.0317 * w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: [
          Colors.black.withOpacity(0.09),
          Colors.white.withOpacity(0.3),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(oval);

    final Paint p3 = Paint()
      ..shader = RadialGradient(
          colors: [
            Colors.black.withOpacity(0.08),
            Colors.black.withOpacity(0.08),
            Colors.black.withOpacity(0.7),
          ],
          center: Alignment.center,
          stops: [0.0, shutter, 1.0]).createShader(oval);

    final Paint p4 = Paint()
      ..shader = RadialGradient(
          colors: [
            (backgroundColor != null)
                ? backgroundColor.withOpacity(backgroundOpacity)
                : Colors.transparent,
            (backgroundColor != null)
                ? backgroundColor.withOpacity(0.08)
                : Colors.transparent,
            (backgroundColor != null)
                ? backgroundColor.withOpacity(0.08)
                : Colors.transparent,
          ],
          center: Alignment.center,
          stops: [1.0, shutter, 0.0]).createShader(oval);

    final Path path1 = Path();
    path1.moveTo(0.099 * w, 0.404 * w);
    path1.quadraticBezierTo(0.258 * w, 0.476 * w, 0.416 * w, 0.48 * w);
    path1.quadraticBezierTo(0.79 * w, 0.468 * w, 0.912 * w, 0.337 * w);
    path1.quadraticBezierTo(0.865 * w, 0.158 * w, 0.734 * w, 0.099 * w);
    path1.quadraticBezierTo(0.575 * w, 0.019 * w, 0.416 * w, 0.0515 * w);
    path1.quadraticBezierTo(0.238 * w, 0.087 * w, 0.158 * w, 0.198 * w);
    path1.quadraticBezierTo(0.079 * w, 0.317 * w, 0.099 * w, 0.404 * w);
    path1.close();

    final Path path2 = Path();
    path2.moveTo(0.18 * w, 0.805 * w);
    path2.quadraticBezierTo(0.317 * w, 0.94 * w, 0.476 * w, 0.94 * w);
    path2.quadraticBezierTo(0.734 * w, 0.932 * w, 0.86 * w, 0.734 * w);
    path2.lineTo(0.813 * w, 0.714 * w);
    path2.quadraticBezierTo(0.714 * w, 0.805 * w, 0.535 * w, 0.805 * w);
    path2.quadraticBezierTo(0.397 * w, 0.8 * w, 0.29 * w, 0.74 * w);
    path2.quadraticBezierTo(0.206 * w, 0.805 * w, 0.18 * w, 0.805 * w);
    path2.close();

    final Path path3 = Path();
    path3.moveTo(0.131 * w, 0.686 * w);
    path3.quadraticBezierTo(0.079 * w, 0.476 * w, 0.166 * w, 0.357 * w);
    path3.quadraticBezierTo(0.238 * w, 0.238 * w, 0.357 * w, 0.178 * w);
    path3.quadraticBezierTo(0.436 * w, 0.12 * w, 0.357 * w, 0.12 * w);
    path3.quadraticBezierTo(0.198 * w, 0.14 * w, 0.1 * w, 0.317 * w);
    path3.quadraticBezierTo(0.027 * w, 0.548 * w, 0.131 * w, 0.686 * w);
    path3.close();

    // canvas output
    canvas.drawCircle(Offset(r, r), r + 0.0277 * w, p2);
    canvas.drawCircle(Offset(r, r), r, p1);
    if ((backgroundColor != null) && (backgroundColor != Colors.transparent))
      canvas.drawCircle(Offset(r, r), r - 0.008 * w, p4);
    canvas.drawCircle(Offset(r, r), r - 0.008 * w, p3);
    canvas.drawPath(path1, ref1);
    canvas.drawPath(path2, ref1);
    canvas.drawPath(path3, ref2);
    if (twinkles) {
      canvas.drawCircle(Offset(0.833 * w, 0.158 * w), 0.055 * w, ref3);
      canvas.drawCircle(Offset(0.0476 * w, 0.476 * w), 0.0635 * w, ref4);
      canvas.drawCircle(Offset(0.158 * w, 0.754 * w), 0.0396 * w, ref5);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
