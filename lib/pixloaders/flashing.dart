import 'dart:math' as math;
import 'package:flutter/material.dart';

class Blinking extends StatelessWidget {
  final AnimationController controller;
  final Color faceColor;
  final double widthRatio;

  Blinking({
    Key key,
    this.controller,
    this.faceColor,
    this.widthRatio,
  }) : super(key: key);

  final Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);
  Animation<double> get stepOne => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            1 / 6,
            curve: Curves.easeIn,
          ),
        ),
      );
  Animation<double> get stepTwo => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            1 / 6,
            2 / 6,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepThree => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            2 / 6,
            0.5,
            curve: Curves.easeIn,
          ),
        ),
      );
  Animation<double> get stepFour => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            4 / 6,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepFive => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            4 / 6,
            5 / 6,
            curve: Curves.easeIn,
          ),
        ),
      );
  Animation<double> get stepSix => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            5 / 6,
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedEye(
            controller: controller,
            animations: [stepOne, stepSix],
            faceColor: faceColor,
            widthRatio: widthRatio,
            isClockwise: true,
          ),
          AnimatedEye(
            controller: controller,
            animations: [stepTwo, stepFive],
            faceColor: faceColor,
            widthRatio: widthRatio,
            isClockwise: false,
          ),
          AnimatedEye(
            controller: controller,
            animations: [stepThree, stepFour],
            faceColor: faceColor,
            widthRatio: widthRatio,
            isClockwise: true,
          ),
        ],
      ),
    );
  }
}

class AnimatedEye extends AnimatedWidget {
  final List<Animation<double>> animations;
  final Animation<double> controller;
  final bool isClockwise;
  final Color faceColor;
  final double widthRatio;

  AnimatedEye(
      {Key key,
      this.controller,
      this.animations,
      this.isClockwise,
      this.faceColor,
      this.widthRatio})
      : super(key: key, listenable: controller);

  final FractionalOffset alignment = FractionalOffset.center;
  Matrix4 blink(animation) => Matrix4.rotationX(animation.value * math.pi);

  @override
  Widget build(BuildContext context) {
    var transformOne = blink(animations[0]);
    var transformTwo = blink(animations[1]);
    return Transform(
      transform: transformOne,
      alignment: alignment,
      child: Transform(
        transform: transformTwo,
        alignment: alignment,
        child: _eye(widthRatio),
      ),
    );
  }

  Widget _eye(double width) {
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green[400],
        gradient: LinearGradient(
          colors: [faceColor, faceColor.withAlpha(120)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }
}
