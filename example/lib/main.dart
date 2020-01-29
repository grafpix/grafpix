// Example

import 'package:grafpix/pixloaders/pix_loader.dart';
import 'package:flutter/material.dart';
import 'package:grafpix/icons.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: waitForFuture(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Container(
                alignment: Alignment.center,
                child: IconButton(

                    // display PixIcon when Future ends.
                    icon: Icon(PixIcon.pix_android,
                        size: 30.0, color: Colors.green[600]),
                    onPressed: () {
                      print('Icon Pressed');
                    }),
              );
            else

              // display PixLoader while Future in progress.
              return PixLoader(
                  loaderType: LoaderType.Spinner,
                  faceColor: Colors.pinkAccent[400]);
          }),
    );
  }
}

// Simulates a future call with 5 seconds delay.
Future waitForFuture() async {
  await Future.delayed(Duration(seconds: 5));
  return true;
}
