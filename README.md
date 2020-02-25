# Grafpix

A growing `Flutter Package` consist of a huge collection of rectified **icons** and **essential utilities** that grant you outstanding user experience in no time.

## Features

- Huge collection of ***icons*** from multiple authors.
- Impressive growing ***utilities*** to improve your design patterns.
- **`WYSIWYG` preview** module for `Flutter` in `Visual Studio Code` to speed up development by providing you with **`Visual Aid`**.
- Ease to deploy.

### `Newly Added >` PixMedal

A Unique Medal Buttons with engraved icons of your choise, the varaieties are Gold, Silver & Bronze Medals.

![Showcase1](https://grafpix.com/release/1.2.6/showcase.jpg)

### PixButtons

A Stunning **`Glass-Like Buttons`** with **fully** customized properties.

![Release](https://grafpix.com/release/1.2.4/showcase.jpg)

![Showcase](https://grafpix.com/release/1.2.4/release.jpg)

### A huge iconset of `+2500` Icons

- 1403 Icons from [FontAwsome 5.12](https://fontawesome.com/).
- 336 Icons from [Stephen Hutchings](https://www.s-ings.com/).
- 467 Icons from [CaptainIcon](https://mariodelvalle.github.io/CaptainIconWeb/).
- 491 Clean pix icons.

[![Grafpix Release 1.2.4](https://grafpix.com/release/1.2.4/youtube2.jpg)](https://www.youtube.com/watch?v=JGzcL0ahyHo)

### PixLoaders

used to simulate *Future* progress indicators.

| LoaderType |                               Output                                |
| ---------- | ------------------------------------------------------------------- |
| Flashing   | ![Flashing](https://grafpix.com/api/pixloaders.php?loader=flashing) |
| Spinner    | ![Spinner](https://grafpix.com/api/pixloaders.php?loader=spinner)   |
| Rocks      | ![Rocks](https://grafpix.com/api/pixloaders.php?loader=rocks)       |

### Installation

In your `pubspec.yaml` under `dependencies` add the following line:

```yaml
dependencies:
  grafpix: ^1.2.6
```

From your `Terminal`, run the following code:

```sh
  flutter pub get
```

### Example

PixIcon and PixLoader example

```dart
import 'package:flutter/material.dart';
import 'package:grafpix/icons.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';
import 'package:grafpix/pixbuttons/radial.dart';
import 'package:grafpix/pixbuttons/medal.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: FutureBuilder(
          future: waitForFuture(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              // display PixButton with PixIcon when Future ends.
              return Container(
                  alignment: Alignment.center,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    PixButton(
                        radius: 70.0,
                        icon: PixIcon.pix_android, //PixIcon
                        iconSize: 50.0,
                        iconColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shutter: 0.6,
                        twinkles: true,
                        onPress: () {
                          print('PixButton Pressed');
                        }),
                    SizedBox(height: 20.0),
                    PixMedal(
                      icon: PixIcon.shopware,
                      medalType: MedalType.Gold,
                      radius: 70.0,
                      iconSize: 60.0,
                    )
                  ]));
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
```

[![GRAFPIX](https://grafpix.com/api/readme.php?rm=logo)](http://grafpix.com)

#### Author

> Ahmed Mustafa < ahmed.dev2020@gmail.com >
> if you have suggestions, please feel free to contact me any time.
> your feedback is highly appreciated.

### License

MIT
