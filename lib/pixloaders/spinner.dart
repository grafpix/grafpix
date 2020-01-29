import 'dart:math' as math;
import 'package:flutter/material.dart';

class FeedingTime extends StatelessWidget {
  final Animation<double> animation;
  final AnimationController controller;
  final Color faceColor;
  final double widthRatio;

  FeedingTime({
    Key key,
    this.animation,
    this.controller,
    this.faceColor,
    this.widthRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: AnimatedFish(
            controller: controller,
            animation: animation,
            faceColor: faceColor,
            widthRatio: widthRatio,
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: math.pi / 2,
            child: AnimatedFish(
              controller: controller,
              animation: animation,
              faceColor: faceColor,
              widthRatio: widthRatio,
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: math.pi,
            child: AnimatedFish(
              controller: controller,
              animation: animation,
              faceColor: faceColor,
              widthRatio: widthRatio,
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: math.pi * 3 / 2,
            child: AnimatedFish(
              controller: controller,
              animation: animation,
              faceColor: faceColor,
              widthRatio: widthRatio,
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedFish extends AnimatedWidget {
  final Animation<double> animation;
  final AnimationController controller;
  final Color faceColor;
  final double widthRatio;

  AnimatedFish({
    Key key,
    this.animation,
    this.controller,
    this.faceColor,
    this.widthRatio,
  }) : super(key: key, listenable: controller);

  Matrix4 _swim(animation) =>
      Matrix4.rotationZ(animation.value * math.pi * 2.0);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: _swim(animation),
      alignment: FractionalOffset(0.0, 1.0),
      child: Transform(
        transform: _swim(animation),
        alignment: FractionalOffset(animation.value, 1.0 + animation.value),
        child: _fish(widthRatio, faceColor),
      ),
    );
  }

  Widget _fish(double widthRatio, Color faceColor) {
    return Container(
      width: widthRatio,
      height: widthRatio * 0.714,
      decoration: BoxDecoration(
        color: faceColor,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(widthRatio),
          topEnd: Radius.circular(widthRatio / 2),
          bottomEnd: Radius.circular(widthRatio),
        ),
      ),
    );
  }
}
