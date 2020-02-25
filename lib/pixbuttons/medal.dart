import 'package:flutter/material.dart';

enum MedalType { Gold, Silver, Bronze }
const Color silver1 = Color(0XFFEEEEEE);
const Color silver2 = Color(0XFF616161);
const Color silver3 = Color(0XFFBDBDBD);
const Color silver4 = Color(0XFF9E9E9E);
const Color silver5 = Color(0XFFF5F5F5);
const Color gold1 = Color(0XFFEEDB8E);
const Color gold2 = Color(0XFF847214);
const Color gold3 = Color(0XFFD0BB5A);
const Color gold4 = Color(0XFFECD157);
const Color gold5 = Color(0XFFB59811);
const Color bronze1 = Color(0XFFCA6511);
const Color bronze2 = Color(0XFF432508);
const Color bronze3 = Color(0XFF77410E);
const Color bronze4 = Color(0XFF5C340C);
const Color bronze5 = Color(0XFFE77012);

class PixMedal extends StatelessWidget {
  final Key key;
  final MedalType medalType;
  final double radius;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double iconOffsetX;
  final double iconOffsetY;
  final Function onPress;
  const PixMedal({
    this.key,
    this.medalType = MedalType.Silver,
    this.radius = 40.0,
    @required this.icon,
    this.iconColor,
    this.iconSize = 40.0,
    this.iconOffsetX = 0.0,
    this.iconOffsetY = 0.0,
    this.onPress,
  })  : assert(icon != null),
        assert(iconOffsetX >= -0.5 && iconOffsetX <= 0.5),
        assert(iconOffsetY >= -0.5 && iconOffsetY <= 0.5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color defColor;
    switch (medalType) {
      case MedalType.Gold:
        defColor = gold5;
        break;
      case MedalType.Bronze:
        defColor = bronze1;
        break;
      default:
        defColor = silver3;
    }
    return GestureDetector(
      onTap: () {
        if (onPress != null) onPress();
      },
      child: CustomPaint(
        painter: SteelShell(medalType),
        child: Container(
          width: radius * 2,
          height: radius * 2,
          child: Stack(children: [
            Align(
              alignment: Alignment(-0.03 + iconOffsetX, -0.03 + iconOffsetY),
              child: Icon(icon,
                  color: Colors.black.withOpacity(0.3),
                  size: (iconSize <= radius) ? iconSize : radius),
            ),
            Align(
              alignment: Alignment(0.03 + iconOffsetX, 0.03 + iconOffsetY),
              child: Icon(icon,
                  color: Colors.white.withOpacity(0.6),
                  size:
                      (iconSize <= radius) ? iconSize * 1.005 : radius * 1.005),
            ),
            Align(
              alignment: Alignment(0.0 + iconOffsetX, 0.0 + iconOffsetY),
              child: Icon(icon,
                  color:
                      ((iconColor != null) && (iconColor != Colors.transparent))
                          ? iconColor.withOpacity(0.8)
                          : defColor.withOpacity(0.8),
                  size:
                      (iconSize <= radius) ? iconSize * 1.005 : radius * 1.005),
            ),
          ]),
        ),
      ),
    );
  }
}

class SteelShell extends CustomPainter {
  final MedalType medalType;
  SteelShell(this.medalType);
  @override
  void paint(Canvas canvas, Size size) {
    Color c1, c2, c3, c4, c5;
    switch (medalType) {
      case MedalType.Gold:
        c1 = gold1;
        c2 = gold2;
        c3 = gold3;
        c4 = gold4;
        c5 = gold5;
        break;
      case MedalType.Bronze:
        c1 = bronze1;
        c2 = bronze2;
        c3 = bronze3;
        c4 = bronze4;
        c5 = bronze5;
        break;
      default:
        c1 = silver1;
        c2 = silver2;
        c3 = silver3;
        c4 = silver4;
        c5 = silver5;
    }

    final double w = size.width;
    final double r = w / 2;
    final Rect oval = Rect.fromCircle(center: Offset(r, r), radius: r);
    final Paint p1 = Paint()
      ..shader = SweepGradient(colors: [
        c1,
        c2,
        c3,
        c1,
        c2,
        c1,
        c4,
        c5,
        c3,
        c1,
      ], stops: [
        0.0,
        0.08,
        0.2,
        0.3,
        0.4,
        0.52,
        0.6,
        0.7,
        0.85,
        1.0,
      ]).createShader(oval);

    final Paint p2 = Paint()
      ..strokeWidth = 0.0317 * w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [
          c2,
          c5,
          c2,
          c5,
          c4,
          c5,
          c2,
        ],
      ).createShader(oval);

    // canvas output
    canvas.drawCircle(Offset(r, r), r, p2);
    canvas.drawCircle(Offset(r, r), r - 0.008 * w, p1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
