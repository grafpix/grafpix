// Example

import 'package:flutter/material.dart';
import 'package:grafpix/icons.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';
import 'package:grafpix/pixbuttons/radial.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: FutureBuilder(
          future: waitForFuture(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              // display PixButton with PixIcon when Future ends.
              return Container(
                alignment: Alignment.center,
                child: PixButton(
                    radius: 70.0,
                    icon: PixIcon.pix_android, //PixIcon
                    iconSize: 50.0,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shutter: 0.6,
                    twinkles: true,
                    onPress: () {
                      print('Icon Pressed');
                    }),
              );
            else
              // display PixLoader while Future in progress.
              return PixLoader(
                  loaderType: LoaderType.Flashing, faceColor: Colors.white70);
          }),
    );
  }
}

// Simulates a future call with 5 seconds delay.
Future waitForFuture() async {
  await Future.delayed(Duration(seconds: 5));
  return true;
}
