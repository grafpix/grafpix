import 'dart:math' as math;
import 'package:flutter/material.dart';

class Hammer extends StatelessWidget {
  final AnimationController controller;
  final Color faceColor;
  final double widthRatio;

  Hammer({
    Key key,
    this.controller,
    this.faceColor,
    this.widthRatio,
  }) : super(key: key);

  static const double fraction = 0.05;
  final Tween<double> tween = Tween<double>(begin: 0.0, end: 1.00);
  Animation<double> get stepOne => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.125,
            curve: Curves.easeIn,
          ),
        ),
      );
  Animation<double> get stepTwo => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.125 - fraction,
            0.25,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepThree => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.25 - (fraction * 2),
            0.375,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepFour => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.375 - (fraction * 3),
            0.5,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepFive => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            0.625,
            curve: Curves.easeIn,
          ),
        ),
      );
  Animation<double> get stepSix => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.625 - fraction,
            0.75,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepSeven => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.75 - (fraction * 2),
            0.875,
            curve: Curves.easeOut,
          ),
        ),
      );
  Animation<double> get stepEight => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.875 - (fraction * 3),
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedHammer(
              controller: controller,
              animations: [
                stepOne,
                stepEight,
              ],
              faceColor: faceColor,
              widthRatio: widthRatio,
              isClockwise: true,
            ),
            AnimatedHammer(
              controller: controller,
              animations: [
                stepTwo,
                stepSeven,
              ],
              faceColor: faceColor,
              widthRatio: widthRatio,
              isClockwise: false,
            ),
            AnimatedHammer(
              controller: controller,
              animations: [
                stepThree,
                stepSix,
              ],
              faceColor: faceColor,
              widthRatio: widthRatio,
              isClockwise: true,
            ),
            AnimatedHammer(
              controller: controller,
              animations: [
                stepFour,
                stepFive,
              ],
              faceColor: faceColor,
              widthRatio: widthRatio,
              isClockwise: false,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedHammer extends AnimatedWidget {
  final List<Animation<double>> animations;
  final Animation<double> controller;
  final bool isClockwise;
  final Color faceColor;
  final double widthRatio;

  AnimatedHammer(
      {Key key,
      this.controller,
      this.animations,
      this.isClockwise,
      this.faceColor,
      this.widthRatio})
      : super(key: key, listenable: controller);

  final FractionalOffset alignment = FractionalOffset.centerRight;
  Matrix4 clockwiseHalf(animation) =>
      Matrix4.rotationZ(animation.value * math.pi);
  Matrix4 counterClockwiseHalf(animation) =>
      Matrix4.rotationZ(-(animation.value * math.pi));

  @override
  Widget build(BuildContext context) {
    var transformOne;
    var transformTwo;
    if (isClockwise) {
      transformOne = clockwiseHalf(animations[0]);
      transformTwo = clockwiseHalf(animations[1]);
    } else {
      transformOne = counterClockwiseHalf(animations[0]);
      transformTwo = counterClockwiseHalf(animations[1]);
    }
    return Transform(
      transform: transformOne,
      alignment: alignment,
      child: Transform(
        transform: transformTwo,
        alignment: alignment,
        child: _box(widthRatio),
      ),
    );
  }

  Widget _box(double width) {
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.all(width / 4),
      decoration: BoxDecoration(
        color: faceColor,
        borderRadius: BorderRadius.circular(width / 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: width / 8,
            spreadRadius: width / 10,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }
}
