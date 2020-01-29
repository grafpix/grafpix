import 'package:flutter/material.dart';
import 'package:grafpix/pixloaders/flashing.dart';
import 'package:grafpix/pixloaders/spinner.dart';
import 'package:grafpix/pixloaders/rocks.dart';

enum LoaderType {
  /// ![GRAFPIX](https://grafpix.com/api/pixloaders.php?loader=rocks)
  Rocks,

  /// ![GRAFPIX](https://grafpix.com/api/pixloaders.php?loader=flashing)
  Flashing,

  /// ![GRAFPIX](https://grafpix.com/api/pixloaders.php?loader=spinner)
  Spinner,
}

/// PixLoader, responsive ui widget displays a waiting progress indecator while calling a Future.
/// by defining [duration] you define a time cycle in *milliseconds* for the animation to complete, the default value
/// is *1000 milliseconds* to complete one cycle,
/// [faceColor] reconstruct the appearance *Color* of the loader, when specified.
/// PixLoader will fit the boundries to meet your design needs by setting [widthRation] from 0.0 to 1.0.
/// ```dart
/// //Example
/// return PixLoader(type: LoaderType.Hammer, widthRatio: 0.3, duration: 500);
/// ```
class PixLoader extends StatefulWidget {
  final LoaderType loaderType;
  final Color faceColor;
  final int duration;
  final double widthRatio;
  PixLoader(
      {Key key,
      this.loaderType: LoaderType.Spinner,
      this.faceColor: Colors.lightBlue,
      this.duration: 1000,
      this.widthRatio: 0.2})
      : super(key: key);

  @override
  _PixLoaderState createState() => _PixLoaderState();
}

class _PixLoaderState extends State<PixLoader>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..repeat();
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _retType(widget.loaderType);

  Widget _retType(LoaderType loaderType) {
    switch (loaderType) {
      case LoaderType.Flashing:
        return Blinking(
          controller: controller,
          faceColor: widget.faceColor,
          widthRatio: widget.widthRatio * MediaQuery.of(context).size.width / 4,
        );
        break;
      case LoaderType.Spinner:
        return FeedingTime(
          animation: animation,
          controller: controller,
          faceColor: widget.faceColor,
          widthRatio: widget.widthRatio * MediaQuery.of(context).size.width / 4,
        );
        break;
      case LoaderType.Rocks:
        return Hammer(
          controller: controller,
          faceColor: widget.faceColor,
          widthRatio: widget.widthRatio * MediaQuery.of(context).size.width / 4,
        );
        break;
      default:
        return FeedingTime(
          animation: animation,
          controller: controller,
          faceColor: widget.faceColor,
          widthRatio: widget.widthRatio * MediaQuery.of(context).size.width / 4,
        );
    }
  }
}
