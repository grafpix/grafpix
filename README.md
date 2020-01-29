# Grafpix

Grafpix `Flutter` **Icon Package** and **Utilities**, is a growing collection of high ranked icons from multiple authors ready to be used in your flutter projects. Grafpix also loaded with essential utilities that help you creating a good user experience. 

## Getting Started

Icons are one of the most useful UI tools available on the web for mobile applications, and when a collection of great icons and utilities are available for you with ease of use, it is even better.

## Features!
  - Top ranked icons from multiple `authors` to grant you the best UI experience for your mobile application users.
  - A growing collection of icons and utilities managed from one single package. 
  - Hassle free, saves your time & efforts.
  - Using one single line of code, you are ready to go.

### A huge iconset of `+2500` Icons
  - 1403 Icons from [FontAwsome 5.12](https://fontawesome.com/).
  - 336 Icons from [Stephen Hutchings](https://www.s-ings.com/).
  - 467 Icons from [CaptainIcon](https://mariodelvalle.github.io/CaptainIconWeb/).
  - 491 standard clean pix icons.

#### Whats New!
  - **`NEW`** -> **WYSIWYG Previewer Module** for `Flutter` in `Visual Studio Code`, this will provide you with **`Visual Aid`** letting you make selections while coding without wasting your time for match mappings and round trips between your device /emulator and IDE.  
  

|  Widget   |                 WYSIWYG Previewer Module                  |
| --------- | --------------------------------------------------------- |
| PixIcon   | ![PixIcon](https://grafpix.com/api/readme.php?rm=pixicon)   |
| PixLoader | ![PixLoader](https://grafpix.com/api/readme.php?rm=pixloader) |


  - **`NEW`** -> 3 animated `PixLoader` used to simulate *Future* progress indications.

  |     LoaderType      |                               Output                                |
  | ------------------- | ------------------------------------------------------------------- |
  | LoaderType.Flashing | ![Flashing](https://grafpix.com/api/pixloaders.php?loader=flashing) |
  | LoaderType.Spinner  | ![Spinner](https://grafpix.com/api/pixloaders.php?loader=spinner)   |
  | LoaderType.Rocks    | ![Rocks](https://grafpix.com/api/pixloaders.php?loader=rocks)       |


### Installation
In your `pubspec.yaml` under `dependencies` add the following line:
```yaml
dependencies:
  grafpix: ^1.2.2
```
From your `Terminal`, run the following code:

```sh
  flutter pub get
```

### Example
PixIcon and PixLoader example
```dart
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
```

[![GRAFPIX](https://grafpix.com/api/readme.php?rm=logo)](http://grafpix.com)
#### Author
> Ahmed Mustafa < ahmed.dev2020@gmail.com >
> if you have suggestions, please feel free to contact me any time.
> your feedback is highly appreciated.

### License
MIT